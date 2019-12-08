//
//  NewsController.swift
//  VK App New
//
//  Created by Екатерина on 13/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
class NewsController: UITableViewController {

    let groups = [
        Group(image: UIImage(named: "hqdefault")!, name: "Six"),
        Group(image: UIImage(named: "new-balance")!, name: "Seven"),
        Group(image: UIImage(named: "pngtree")!, name: "Eight"),
        Group(image: UIImage(named: "17a3a1aef")!, name: "Nine"),
        Group(image: UIImage(named: "fddd0747")!, name: "Ten")
    ]
    
    var newsImage: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else {
        preconditionFailure("NewsCell cannot be dequeued")
        }
        
        let newsName = groups[indexPath.row].name
        cell.nameNewsLabel?.text = newsName
        
        let groupImage = groups[indexPath.row].image
        cell.newsOneImageView.image = groupImage
        
        let newsImage = groups[indexPath.row].image
        cell.newsTwoImageView.image = newsImage
            
        return cell
        }
    
    @IBAction func logoutNews(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension NewsController: NewsCellDelegate {
    func likedControl(isLike: Bool) {
        print("Just primt for like in News")
    }
}
