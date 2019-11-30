//
//  NewsCell.swift
//  VK App New
//
//  Created by Екатерина on 30/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var newsOneImageView: UIImageView!
    
    @IBOutlet weak var newsTwoImageView: UIImageView!
    
    @IBOutlet weak var nameNewsLabel: UILabel!
    
    @IBOutlet weak var newsLikeControl: LikeControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
