//
//  AllGroupController.swift
//  VK App New
//
//  Created by Екатерина on 02/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

class AllGroupController: UIViewController {
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }

    let groups = [
        Group(image: UIImage(named: "garage")!, name: "Group 6"),
        Group(image: UIImage(named: "11")!, name: "Group 7"),
        Group(image: UIImage(named: "1089093")!, name: "Group 8"),
        Group(image: UIImage(named: "unnamed")!, name: "Group 9"),
        Group(image: UIImage(named: "icon")!, name: "Group 10")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
extension AllGroupController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicGroupCell", for: indexPath)
        
        let groupname = groups[indexPath.row].name
        let groupImage = groups[indexPath.row].image
        cell.textLabel?.text = groupname
        cell.imageView?.image = groupImage
        
        return cell
    }
    
    
}
