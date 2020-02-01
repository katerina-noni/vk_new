//  VK App New
//
//  Created by Екатерина on 01/02/2020.
//  Copyright © 2019 noni. All rights reserved.
//

import Foundation
import RealmSwift

class RealmGroups: Object {
    @objc dynamic var id: Int = 12
    @objc dynamic var name: String = ""
    @objc dynamic var image: String = ""
    
    convenience init(id: Int, name: String, image: String) {
        self.init()
        
        self.id = id
        self.name = name
        self.image = image
    }
}
