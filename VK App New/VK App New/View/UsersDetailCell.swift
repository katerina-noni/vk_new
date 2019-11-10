//
//  UsersDetailCell.swift
//  VK App New
//
//  Created by Екатерина on 02/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

class UsersDetailCell: UICollectionViewCell {
    
    @IBOutlet var detailImageView: UIImageView!
    
    @IBOutlet var likeControl: LikeControl!
    
    public func configureLikeControl(likes count: Int, isLikedByUser: Bool){
        likeControl.configure(likes: count, isLikedByUser: isLikedByUser)
    }
}
