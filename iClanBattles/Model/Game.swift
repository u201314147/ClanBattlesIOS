//
//  Game.swift
//  iClanBattles
//
//  Created by Anonimo on 7/10/18.
//  Copyright © 2018 ALEXIS-PC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Game {
    var id: Int
    var name: String
    var description: String
    var urlWebPage: String
    var imageUrl: String
    var rating: Double
    var status: String
    
    init() {
        id = 0
        name = ""
        description = ""
        urlWebPage = ""
        imageUrl = ""
        rating = 0.0
        status = ""
    }
    
    init(from jsonObject: JSON) {
        id = jsonObject["id"].intValue
        name = jsonObject["name"].stringValue
        description = jsonObject["description"].stringValue
        urlWebPage = jsonObject["urlWebPage"].stringValue
        imageUrl = jsonObject["imageUrl"].stringValue
        rating = jsonObject["rating"].doubleValue
        status = jsonObject["status"].stringValue
    }
    
    static func from(jsonGames: [JSON]) -> [Game] {
        var games: [Game] = []
        let count = jsonGames.count
        for i in 0...count - 1 {
            games.append(Game.init(from: jsonGames[i]))
        }
        return games
    }
}
