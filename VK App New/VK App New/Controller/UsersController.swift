//
//  UsersController.swift
//  VK App New
//
//  Created by Екатерина on 02/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

class UsersController: UITableViewController {
    
    @IBOutlet var userSearchBar: UISearchBar! {
        didSet {
            userSearchBar.delegate = self
        }
    }
    
    let user = [
        Users(image: UIImage(named: "769991")!, name: "Алексеева"),
        Users(image: UIImage(named: "391073")!, name: "Кабанов"),
        Users(image: UIImage(named: "profile")!, name: "Афанасьева"),
        Users(image: UIImage(named: "shkpj")!, name: "Жданов"),
        Users(image: UIImage(named: "391073")!, name: "Осипов"),
        Users(image: UIImage(named: "hanxiang")!, name: "Красильникова"),
        Users(image: UIImage(named: "invisible")!, name: "Жданова"),
        Users(image: UIImage(named: "medium")!, name: "Доронина"),
        Users(image: UIImage(named: "x1926396")!, name: "Богданов"),
        Users(image: UIImage(named: "Uq1tTvQrKuI")!, name: "Петухов"),
        Users(image: UIImage(named: "300_300")!, name: "Степанов")
    ]
    
    var filteredUsers = [Users]()
    var sortedUsers = [Character: [Users]]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "UserXibCell", bundle: nil), forCellReuseIdentifier: "UserXibCell")
        
        self.sortedUsers = sort(user: user)
    }
    
    private func sort(user: [Users]) -> [Character: [Users]] {
        var userDick = [Character: [Users]]()
        
        user.forEach { users in
            guard let firstUser = users.name.first else { return }
            if var thisCharUser = userDick[firstUser] {
                thisCharUser.append(users)
                userDick[firstUser] = thisCharUser.sorted { $0.name < $1.name }
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
        let users: Users = user[indexPath.row]
        cell.nameUserLabel.text = users.name
        cell.fotoUserImageView.image = users.image

        return cell
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         if segue.identifier == "UserDetailPhotos",
//             let destinationVC = segue.destination as? UsersDetailController,
//             let indexPath = tableView.indexPathForSelectedRow {
//             let usersname = user[indexPath.row].name
//             destinationVC.title = usersname
//         }
//     }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVC = UIStoryboard(
            name: "Main",
            bundle: nil).instantiateViewController(withIdentifier: "UserPhotos") as! UsersDetailController
        
        let keysection = sortedUsers.keys.sorted()[indexPath.section]
        let detailInfo = sortedUsers[keysection]![indexPath.row]
        
        destinationVC.title = detailInfo.name
        
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func logoutUserButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension UsersController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredUsers = user
        } else {
            filteredUsers = user.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        sortedUsers = sort(user: filteredUsers)
        tableView.reloadData()
    }
}
