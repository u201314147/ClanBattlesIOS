//
//  ClanBattlesService.swift
//  Test
//
//  Created by Anonimo on 7/10/18.
//  Copyright © 2018 ALEXIS-PC. All rights reserved.
//

import Foundation

class ClanBattlesService {
    static let baseUrl = "http://clanbattlesv2.somee.com/clanbattles"
    static let baseUrl1 = "http://clanbattles.somee.com/clanbattles"
    static let gamesUrl = baseUrl + "/v1/games"
    static let gamesUrl2 = baseUrl1 + "/v1/games"
    static let getLanCentersUrl = baseUrl + "/v1/lancenters"
    static let getGamersUrl = baseUrl + "/v1/gamers"
    func getPublicationByGamer(gamerId:Int) -> String{
        return ClanBattlesService.gamesUrl + "/" + String(gamerId) + "/publications"}
    func urlPostPublication(gamerId:Int) -> String{
        return ClanBattlesService.gamesUrl + "/" + String(gamerId) + "/publications"}
    func getClanUrl(gameId: Int) -> String {
        return ClanBattlesService.gamesUrl + "/" + String(gameId) + "/clans"}
    static let tag = "ClanBattles"
}
