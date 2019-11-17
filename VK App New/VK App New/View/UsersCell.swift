//
//  UsersCell.swift
//  VK App New
//
//  Created by Екатерина on 02/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

class UsersCell: UITableViewCell {


    @IBOutlet weak var usersImageView: UIImageView!
    
    @IBOutlet weak var usersLabel: UILabel!
    
    @IBOutlet weak var likeControl: LikeControl!
    
    
    public func configureLikeControl(likes count: Int, isLikedByUser: Bool){
        likeControl.configure(likes: count, isLikedByUser: isLikedByUser)
    }
}
