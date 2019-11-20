//
//  AnimationController.swift
//  VK App New
//
//  Created by Екатерина on 19/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

class AnimationController: UIViewController {
    
    @IBOutlet var indicationImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

            UIView.animate(withDuration: 0.5, delay: 2, options: [.repeat, .curveLinear], animations: {
                self.indicationImageView.alpha = 0
            })
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
           self.performSegue(withIdentifier: "Animation Segue", sender: nil)
        })
    }

}
