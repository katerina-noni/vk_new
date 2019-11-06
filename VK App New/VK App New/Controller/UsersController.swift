//
//  UsersController.swift
//  VK App New
//
//  Created by Екатерина on 02/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

class UsersController: UITableViewController {
    
    let user = [
        Users(image: UIImage(named: "769991")!, name: "Friend 1"),
        Users(image: UIImage(named: "391073")!, name: "Friend 2"),
        Users(image: UIImage(named: "profile")!, name: "Friend 3"),
        Users(image: UIImage(named: "shkpj")!, name: "Friend 4")
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
        return user.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UsersCell", for: indexPath) as? UsersCell else {
           preconditionFailure("UsersCell cannot be dequeued")
        }
            let usersname = user[indexPath.row].name
            let usersImage = user[indexPath.row].image
            cell.usersLabel.text = usersname
            cell.usersImageView.image = usersImage


        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "Show Detail Users",
             let destinationVC = segue.destination as? UsersDetailController,
             let indexPath = tableView.indexPathForSelectedRow {
             let usersname = user[indexPath.row].name
             destinationVC.title = usersname
         }
     }
    
    @IBAction func logoutButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
