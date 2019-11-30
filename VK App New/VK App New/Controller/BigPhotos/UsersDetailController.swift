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

    public var photos = [UIImage]()

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
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UsersDetailCell", for: indexPath) as! UsersDetailCell
    
        cell.detailImageView.image = photos[indexPath.item]
        return cell
    }
}
extension UsersDetailController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Big Photo",
            let selectedPhotoIndexPath = collectionView.indexPathsForSelectedItems?.first,
            let bigPhotoVC = segue.destination as? BigPhotosController {
            bigPhotoVC.photos = photos
            bigPhotoVC.selectedPhotoIndex = selectedPhotoIndexPath.item
            collectionView.deselectItem(at: selectedPhotoIndexPath, animated: true)
        }
    }
}
