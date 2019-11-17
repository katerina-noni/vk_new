//
//  NewsController.swift
//  VK App New
//
//  Created by Екатерина on 13/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

class NewsController: UITableViewController {

    let news = [
        News(image: UIImage(named: "smile")!, name: "News")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    navigationController?.setNavigationBarHidden(false, animated: true)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else {
        preconditionFailure("NewsCell cannot be dequeued")
        }
            print("Section: " + String(indexPath.section) + ", row: " + String(indexPath.row))
            let newImage = news[indexPath.row].image
            let nameNews = news[indexPath.row].name
            cell.newsImageView.image = newImage
            cell.newsLabel.text = nameNews
            
        return cell
        }
}
