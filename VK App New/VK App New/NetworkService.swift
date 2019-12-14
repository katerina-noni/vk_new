//
//  NetworkService.swift
//  VK App New
//
//  Created by Екатерина on 08/12/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {
    static let session: Alamofire.Session = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 20
        let session = Alamofire.Session(configuration: config)
        return session
    }()
    
    static func loadGroups(token: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.92"
        ]
        
        NetworkService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            guard let json = response.value else { return }
            
            print(json)
        }
    }
    
    static func loadFriends(token: String) {
        let baseFriendUrl = "https://api.vk.com"
        let pathFriend = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": token,
            "order": "name",
            "count": "3",
            "offset": "5",
            "fields": "city,domain",
            "name_case": "ins",
            "v": "5.8"
        ]
        
        NetworkService.session.request(baseFriendUrl + pathFriend, method: .get, parameters: params).responseJSON { response in
            guard let json = response.value else { return }
            
            print(json)
        }
    }
    
    static func loadPhotos(token: String) {
        let baseUrlPhotos = "https://api.vk.com"
        let pathPhotos = "/method/photos.get"
        
        let params: Parameters = [
            "access_token": token,
            "owner_id": "-1",
            "album_id": "wall",
            "rev": "0",
            "extended": "0",
            "count": "2",
            "v": "5.77"
        ]
        
        NetworkService.session.request(baseUrlPhotos + pathPhotos, method: .get, parameters: params).responseJSON { response in
            guard let json = response.value else { return }
            
            print(json)
        }
        
    }
    
    static func loadGroupSearch(token: String) {
        let baseUrlGroupSearch = "https://api.vk.com"
        let pathGroupSearch = "/method/groups.search"
        
        let params: Parameters = [
            "q": "Music",
            "type": "group",
            "future": "0",
            "market": "0",
            "offset": "3",
            "count": "3",
            "v": "5.58"
        ]
        
        NetworkService.session.request(baseUrlGroupSearch + pathGroupSearch, method: .get, parameters: params).responseJSON { response in
        guard let json = response.value else { return }
        
        print(json)
        }
    }
}
