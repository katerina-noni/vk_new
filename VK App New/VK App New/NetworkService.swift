//
//  NetworkService.swift
//  VK App New
//
//  Created by Екатерина on 08/12/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkService {
    static let session: Alamofire.Session = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 20
        let session = Alamofire.Session(configuration: config)
        return session
    }()
    
    private let userId = "7239049"
    private let baseUrl = "https://api.vk.com"
    private let versionAPI = "5.92"
    private let token: String
    
    init(token: String) {
        self.token = token
    }
    
    
    
    func loadGroups(userId: Int, completion: ((Swift.Result<[Groups], Error>)-> Void)? = nil) {
        let path = "/method/groups.get"
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": versionAPI
        ]
        
        NetworkService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            switch response.result {
            case let .success(data):
                let json = JSON(data)
                
                let groupJSONs = json["response"].arrayValue
                let groups = groupJSONs.map { Groups(from: $0) }
                completion?(.success(groups))
                
            case let .failure(error):
                completion?(.failure(error))
            }
        }
    }
    
    func loadFriends(completion: ((Swift.Result<[User], Error>)-> Void)? = nil) {
        let pathFriend = "/method/friends.get"
        let params: Parameters = [
            "access_token": token,
            "fields": "photo_100",
            "v": versionAPI
        ]
        
        NetworkService.session.request(baseUrl + pathFriend, method: .get, parameters: params).responseJSON { response in
            switch response.result {
            case let .success(data):
                let json = JSON(data)
                let friendJSONs = json["response"].arrayValue
                let friens = friendJSONs.map { User(from: $0) }
                completion?(.success(friens))
                
            case let .failure(error):
                completion?(.failure(error))
            }
        }
    }
    
    func loadPhotos(userId: Int, completion: ((Swift.Result<[Photos], Error>)-> Void)? = nil) {
        let pathPhotos = "/method/photos.getAll"
        
        let params: Parameters = [
            "access_token": token,
            "owner_id": userId,
            "extended": 1,
            "v": versionAPI
        ]
        
        NetworkService.session.request(baseUrl + pathPhotos, method: .get, parameters: params).responseJSON { response in
        switch response.result {
        case let .success(data):
            let json = JSON(data)
            let photosJSONs = json["response"].arrayValue
            let photos = photosJSONs.map { Photos(from: $0) }
        completion?(.success(photos))
        
            case let .failure(error):
            completion?(.failure(error))
        }
        
    }
}
    
    func loadGroupSearch(token: String) {
        let pathGroupSearch = "/method/groups.search"
        
        let params: Parameters = [
            "q": "Music",
            "type": "group, page",
            "future": "0",
            "market": "0",
            "offset": "3",
            "count": "3",
            "v": versionAPI
        ]
        
        NetworkService.session.request(baseUrl + pathGroupSearch, method: .get, parameters: params).responseJSON { response in
        guard let json = response.value else { return }
        
        print(json)
        }
    }
}
