//
//  UsersDetailCell.swift
//  VK App New
//
//  Created by Екатерина on 02/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit
protocol UserDetailCellDelegate: class {
    func likeControlImage(isLike: Bool)
}
class UsersDetailCell: UICollectionViewCell {
    
    @IBOutlet var detailImageView: UIImageView!
    
    @IBOutlet var likeControl: LikeControl!
    
    public var delegate: UserDetailCellDelegate?
    public func configureLikeControl(likes count: Int, isLikedByUser: Bool){
        likeControl.configure(likes: count, isLikedByUser: isLikedByUser)
    }
    
    @IBAction func likeControl(_ sender: Any) {
        delegate?.likeControlImage(isLike: false)
    }
    public func configure(with photos: Photos) {
        self.detailImageView.kf.setImage(with: URL(string: photos.imageCell))
    }
}
