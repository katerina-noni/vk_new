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
    private let networkService = NetworkService(token: Session.access.token)

    var userId = Int()
    var photos = [Photos]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkService.loadPhotos(userId: userId) { result in
            switch result {
            case let .success(photos):
                self.photos = photos
                guard !photos.isEmpty else { return }
                DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                case let .failure(error):
                    print(error)
            }
        }
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
    
        let photo: Photos = photos[indexPath.row]
        cell.configure(with: photo)
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
extension UsersDetailController: UserDetailCellDelegate {
    func likeControlImage(isLike: Bool) {
        print("Just print for delegate")
    }
    
    
}
