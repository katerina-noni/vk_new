//
//  NetworkService.swift
//  VK App New
//
//  Created by Екатерина on 12/04/2020.
//  Copyright © 2020 noni. All rights reserved.
//

import Foundation
import RealmSwift

class RealmProvider {
    static let deleteIfMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    static func save<T: Object>(items: [T],
        configuration: Realm.Configuration = deleteIfMigration,
        update: Realm.UpdatePolicy = .modified) throws {
        let realm = try Realm(configuration: configuration)
        print(configuration.fileURL ?? "")
        try realm.write {
            realm.add(items, update: update)
        }
    }
}
