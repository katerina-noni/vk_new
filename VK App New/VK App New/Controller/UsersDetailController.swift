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
        UIImage(named: "1089093"),
        UIImage(named: "391073"),
        UIImage(named: "769991")
    ]

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UsersDetailCell", for: indexPath) as? UsersDetailCell else { preconditionFailure() }
    
        // Configure the cell
        cell.detailImageView.image = photos[indexPath.item]
    
        return cell
    }

}
