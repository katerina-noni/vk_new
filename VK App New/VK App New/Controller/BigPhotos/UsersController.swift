//
//  UsersController.swift
//  VK App New
//
//  Created by Екатерина on 02/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit


class UsersController: UITableViewController {
    
    private let networkService = NetworkService(token: Session.access.token)
    
    @IBOutlet var userSearchBar: UISearchBar! {
        didSet {
            userSearchBar.delegate = self
        }
    }
    private var user = [User]()
    var filteredUsers = [Character: [User]]()
    var sortedUsers = [Character: [User]]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "UserXibCell", bundle: nil), forCellReuseIdentifier: "UserXibCell")
        
        self.sortedUsers = sort(user: user)
        
        networkService.loadFriends() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(user):
                guard !user.isEmpty else { return }
                self.user = user
                self.sortedUsers = self.sort(user: user)
                self.filteredUsers = self.sortedUsers
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case let .failure(error):
                print(error)
            }
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func sort(user: [User]) -> [Character: [User]] {
        var userDick = [Character: [User]]()
        
        user.forEach { users in
            guard let firstUser = users.fullName.first else { return }
            if var thisCharUser = userDick[firstUser] {
                thisCharUser.append(users)
                userDick[firstUser] = thisCharUser
            } else {
                userDick[firstUser] = [users]
            }
            
        }
        return userDick
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sortedUsers.keys.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let firstUser = sortedUsers.keys.sorted()[section]
        return String(firstUser)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keysSort = sortedUsers.keys.sorted()
        return sortedUsers[keysSort[section]]?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserXibCell", for: indexPath) as? UserXibCell else {
           preconditionFailure("UserXibCell cannot be dequeued")
        }
        
        let firstUser = sortedUsers.keys.sorted()[indexPath.section]
        let user = sortedUsers[firstUser]!
        let users: User = user[indexPath.row]

        cell.configure(with: users)

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "UserDetailPhotos", sender: nil)
    }
    
    @IBAction func logoutUserButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension UsersController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredUsers = sortedUsers
        } else {
            filteredUsers = user.filter { ($0.fullName.lowercased() as AnyObject).contains(searchText.lowercased()) }
        }
        sortedUsers = sort(user: filteredUsers)
        tableView.reloadData()
    }
}

extension UsersController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UserDetailPhotos",
            let allPhotosVC = segue.destination as? UsersDetailController,
            let selectedCellIndexPath = tableView.indexPathForSelectedRow {
            
            let firstUser = sortedUsers.keys.sorted()[selectedCellIndexPath.section]
            let user = sortedUsers[firstUser]![selectedCellIndexPath.row]
            
            
        }
    }
}
