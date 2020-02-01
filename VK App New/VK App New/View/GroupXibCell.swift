//
//  GroupXibCell.swift
//  VK App New
//
//  Created by Екатерина on 30/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit
import Kingfisher

class GroupXibCell: UITableViewCell {
    
    @IBOutlet weak var nameGroupLabel: UILabel!
    
    @IBOutlet weak var fotoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        fotoImageView.layer.cornerRadius = frame.height / 2
        fotoImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        UIView.animateKeyframes(withDuration: 0.6,
                                delay: 0,
                                options: [],
                                animations: {
                                    self.fotoImageView.bounds.size.height *= 2
        })
    }
    
    public func configure(with groups: Groups) {
        self.nameGroupLabel.text = groups.name
        self.fotoImageView.kf.setImage(with: URL(string: groups.image))
    }
    
}
