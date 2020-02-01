//
//  UserXibCell.swift
//  VK App New
//
//  Created by Екатерина on 30/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

class UserXibCell: UITableViewCell {
    
    @IBOutlet weak var nameUserLabel: UILabel!
    
    @IBOutlet weak var fotoUserImageView: UIImageView!
    
    @IBOutlet weak var frameUserView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        fotoUserImageView.layer.cornerRadius = frame.height / 2
        fotoUserImageView.clipsToBounds = true
        
        fotoUserImageView.layer.shadowColor = UIColor.black.cgColor
        fotoUserImageView.layer.backgroundColor = UIColor.clear.cgColor
        fotoUserImageView.layer.shadowOffset = .init(width: 3, height: 2)
        fotoUserImageView.layer.shadowRadius = 2
        fotoUserImageView.layer.shadowOpacity = 0.3
        fotoUserImageView.layer.shadowPath = UIBezierPath.init(roundedRect: frameUserView.bounds, cornerRadius: 150).cgPath
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        UIView.animate(withDuration: 0.6,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        self.fotoUserImageView.bounds.size.height *= 2
        })
    }
    public func configure(with friends: User) {
        self.nameUserLabel.text = friends.fullName
        self.fotoUserImageView.kf.setImage(with: URL(string: friends.photoURL))
    }
}
