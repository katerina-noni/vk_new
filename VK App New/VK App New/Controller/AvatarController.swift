//
//  AvatarController.swift
//  VK App New
//
//  Created by Екатерина on 09/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

class AvatarController: UIViewController {


    @IBOutlet weak var avatarImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        avatarImage.layer.cornerRadius = avatarImage.frame.size.width / 2
        avatarImage.clipsToBounds = true
    }


    @IBAction func logoutButtonAvatar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
