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
    private let networkServise = NetworkService(token: Session.access.token)
    
    var groups = [Groups]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    }

extension AllGroupController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasicGroupCell", for: indexPath) as? BasicGroupCell else {
            preconditionFailure("BasicGroupCell is missing")}
        
        let groupNew = groups[indexPath.row]
        cell.configure(with: groupNew)
        return cell
    }
    
    
}
