//
//  GroupController.swift
//  VK App New
//
//  Created by Екатерина on 31/10/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

class GroupController: UITableViewController {
    
    var groups = [
        Group(image: UIImage(named: "garage")!, name: "Group 1"),
        Group(image: UIImage(named: "11")!, name: "Group 2"),
        Group(image: UIImage(named: "1089093")!, name: "Group 3"),
        Group(image: UIImage(named: "unnamed")!, name: "Group 4"),
        Group(image: UIImage(named: "icon")!, name: "Group 5")
    ]
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)

    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell else {
           preconditionFailure("GroupCell cannot be dequeued")
        }
        
        print("Section: " + String(indexPath.section) + ", row: " + String(indexPath.row))
        let groupname = groups[indexPath.row].name
        let groupImage = groups[indexPath.row].image
        cell.groupNameLabel.text = groupname
        cell.groupImageView.image = groupImage
        return cell
    }
    @IBAction func addSelectedGroup(segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? AllGroupController,
            let indexPath = sourceVC.tableView.indexPathForSelectedRow {
            let group = sourceVC.groups[indexPath.row]
            if !groups.contains(where:{ $0.name == group.name}) {
                groups.append(group)
                tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func logoutButtonGroup(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
