//
//  AvatarControl.swift
//  VK App New
//
//  Created by Екатерина on 09/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit
@IBDesignable
class AvatarControl: UIControl {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        layer.shadowColor = UIColor.black.cgColor
       // layer.cornerRadius = frame.size.width / 2
        layer.shadowOffset = .zero
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        
    }

}
