//
//  Publication.swift
//  iClanBattles
//
//  Created by ALEXIS-PC on 10/22/18.
//  Copyright © 2018 ALEXIS-PC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Publication {
    var id: Int
    var gamerId: Int
    var gameId: Int
    var title: String
    var description: String
    var urlToImage: String
    var publicationDate: String
    var status: String
    
    init() {
        id = 0
        gamerId = 0
        gameId = 0
        title = ""
        description = ""
        urlToImage = ""
        publicationDate = ""
        status = ""
    }
    
    init(from jsonObject: JSON) {
        id = jsonObject["id"].intValue
        gamerId = jsonObject["gamerId"].intValue
        gameId = jsonObject["gameId"].intValue
        title = jsonObject["title"].stringValue
        description = jsonObject["description"].stringValue
        urlToImage = jsonObject["urlToImage"].stringValue
        publicationDate = jsonObject["publicationDate"].stringValue
        status = jsonObject["status"].stringValue
    }
    
    static func from(jsonPublications: [JSON]) -> [Publication] {
        var publications: [Publication] = []
        let count = jsonPublications.count
        for i in 0...count - 1 {
            publications.append(Publication.init(from: jsonPublications[i]))
        }
        return publications
    }
}
