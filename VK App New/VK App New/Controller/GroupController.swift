//
//  GroupController.swift
//  VK App New
//
//  Created by Екатерина on 31/10/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

class GroupController: UITableViewController {
    
    private let networkServise = NetworkService(token: Session.access.token)
    
    @IBOutlet weak var groupSearchBar: UISearchBar! {
        didSet {
            groupSearchBar.delegate = self
        }
    }
    var groups = [Groups]()
    var filterGroup = [Groups]()
    var sortedGroup: [Character: [Groups]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "GroupXibCell", bundle: nil), forCellReuseIdentifier: "GroupXibCell")
              
            self.sortedGroup = sortedGroupArray(array: groups)
        networkServise.loadGroups(userId: Session.access.userId) {
            result in
            switch result {
            case let .success(groups):
                self.groups = groups
                guard !groups.isEmpty else { return }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    private func sortedGroupArray(array: [Groups]) -> [Character:[Groups]] {
        var sortDict = [Character: [Groups]]()
        
        array.forEach { group in
            guard let firstChar = group.name.first else { return }
            
            if var sortedArray = sortDict[firstChar] {
                sortedArray.append(group)
                sortDict[firstChar] = sortedArray.sorted {
                    $0.name < $1.name }
            } else {
                sortDict[firstChar] = [group]
            }
        }
        return sortDict
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sortedGroup.keys.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let keySorted = sortedGroup.keys.sorted()[section]
        return String(keySorted)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keySorted = sortedGroup.keys.sorted()
        return sortedGroup[keySorted[section]]?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupXibCell", for: indexPath) as? GroupXibCell else {
           preconditionFailure("GroupXibCell cannot be dequeued")
        }
        
        let firstChar = sortedGroup.keys.sorted()[indexPath.section]
        let groupFirst = sortedGroup[firstChar]!
        let group: Groups = groupFirst[indexPath.row]
        
        cell.configure(with: group)
        
        return cell
    }
    @IBAction func addSelectedGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "Add New Group",
            let sourceVC = segue.source as? AllGroupController,
            let indexPath = sourceVC.tableView.indexPathForSelectedRow {
            let group = sourceVC.groups[indexPath.row]
            if !groups.contains(where:{ $0.name == group.name}) {
                groups.append(group)
                sortedGroup = sortedGroupArray(array: groups)
                tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let firtstChar = sortedGroup.keys.sorted()[indexPath.section]
            let groupFirst = sortedGroup[firtstChar]!
            let group = groupFirst[indexPath.row]
            
            let initialSectionsCount = sortedGroup.keys.count
            
            groups.removeAll { $0.name == group.name }
            
            if (groupSearchBar.text ?? "").isEmpty {
                filterGroup = groups
            } else {
                filterGroup = groups.filter {
                    $0.name.lowercased().contains(groupSearchBar.text!.lowercased())
                }
            }
            
            sortedGroup = sortedGroupArray(array: filterGroup)
            
            if initialSectionsCount - sortedGroup.keys.count == 0 {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            } else {
                tableView.deleteSections(IndexSet([indexPath.section]), with: .automatic)
            }
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func logoutButtonGroup(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension GroupController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filterGroup = groups
        } else {
            filterGroup = groups.filter{
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
        sortedGroup = sortedGroupArray(array: filterGroup)
        tableView.reloadData()
    }
}
