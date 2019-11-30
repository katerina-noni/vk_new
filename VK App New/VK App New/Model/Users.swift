//
//  Users.swift
//  VK App New
//
//  Created by Екатерина on 02/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

class Users {
    let image: UIImage?
    let name: String
    let photos: [UIImage]
    
    init(image: UIImage, name: String) {
        self.image = image
        self.name = name
        self.photos = []
    }
    
    init(image: UIImage, name: String, photos: [UIImage]) {
        self.image = image
        self.name = name
        self.photos = photos
    }
}
