//
//  Group.swift
//  VK App New
//
//  Created by Екатерина on 02/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

class Group {
    let image: UIImage?
    let name: String
    
    init(image: UIImage, name: String) {
        self.image = image
        self.name = name
    }
    
    init(name: String) {
        self.image = nil
        self.name = name
    }
}
