//
//  Clan.swift
//  iClanBattles
//
//  Created by ALEXIS-PC on 10/23/18.
//  Copyright © 2018 ALEXIS-PC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Clan {
    
    var id:Int
  //  var game:Game
    var name:String
    var rating:Int
    var win:Int
    var lose:Int
    var winRate:Double
    var status:String
    var urlToImage:String
    
    
    init() {
        id = 0
        name = ""
        rating = 0
        win = 0
        lose = 0
        winRate = 0
        status = ""
        urlToImage = ""
    }
    
    init(from jsonObject: JSON) {
        id = jsonObject["id"].intValue
        name = jsonObject["name"].stringValue
        rating = jsonObject["rating"].intValue
        win = jsonObject["win"].intValue
        lose = jsonObject["lose"].intValue
        winRate = jsonObject["winRate"].doubleValue
        status = jsonObject["status"].stringValue
        urlToImage = jsonObject["urlToImage"].stringValue
    }
    
    static func from(jsonClans: [JSON]) -> [Clan] {
        var clans: [Clan] = []
        let count = jsonClans.count
        for i in 0...count - 1 {
            clans.append(Clan.init(from: jsonClans[i]))
        }
        return clans
    }
}
