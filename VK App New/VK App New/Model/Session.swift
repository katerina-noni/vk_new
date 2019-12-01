//
//  Session.swift
//  VK App New
//
//  Created by Екатерина on 01/12/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import Foundation

class Session {
    private init(){ }
    
    public static let access = Session()
    
    var userId = 0
    var token = ""
}
