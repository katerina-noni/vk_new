//  VK App New
//
//  Created by Екатерина on 01/02/2020.
//  Copyright © 2019 noni. All rights reserved.
//

import Foundation
import RealmSwift

class RealmUser: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var photoURL: String = ""
    
    convenience init(id: String, firstName: String, lastName: String, photoURL: String) {
        self.init()
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.photoURL = photoURL
    }
}
