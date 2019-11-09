//
//  UIViewController+Ext.swift
//  VK App New
//
//  Created by Екатерина on 23/10/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

extension UIViewController {
    func show(message: String) {
        let alertVC = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }
}
extension Int {
    var degreesToRadians: CGFloat { return CGFloat(self) * .pi / 180 }
}
