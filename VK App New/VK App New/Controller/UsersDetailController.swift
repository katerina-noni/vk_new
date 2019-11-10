//
//  UsersDetailController.swift
//  VK App New
//
//  Created by Екатерина on 02/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class UsersDetailController: UICollectionViewController {

    private let photos = [
        UIImage(named: "shkpj"),
        UIImage(named: "1089093")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UsersDetailCell", for: indexPath) as? UsersDetailCell else { preconditionFailure() }
    
        cell.detailImageView.image = photos[indexPath.item]
        
        let count = Int.random(in: 5...500)
        let isLiked = Bool.random()
        cell.configureLikeControl(likes: count, isLikedByUser: isLiked)

        return cell
    }
}
