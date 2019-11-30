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
        Group(image: UIImage(named: "hqdefault")!, name: "Six"),
        Group(image: UIImage(named: "new-balance")!, name: "Seven"),
        Group(image: UIImage(named: "pngtree")!, name: "Eight"),
        Group(image: UIImage(named: "17a3a1aef")!, name: "Nine"),
        Group(image: UIImage(named: "fddd0747")!, name: "Ten")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
