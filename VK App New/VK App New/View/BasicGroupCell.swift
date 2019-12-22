//
//  GroupXibCell.swift
//  VK App New
//
//  Created by Екатерина on 22/12/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit
import Kingfisher


class BasicGroupCell: UITableViewCell {
    
    @IBOutlet weak var nameGroupLabel: UILabel!
    
    @IBOutlet weak var imageGroupImageView: UIImageView!
    
    public func configure(with addGroup: Groups) {
        self.nameGroupLabel.text = addGroup.name
        self.imageGroupImageView.kf.setImage(with: URL(string: addGroup.image))
    }
}
