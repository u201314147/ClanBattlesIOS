//
//  ClanBattlesService.swift
//  Test
//
//  Created by Anonimo on 7/10/18.
//  Copyright © 2018 ALEXIS-PC. All rights reserved.
//

import Foundation

class ClanBattlesService {
    static let baseUrl = "http://clanbattles.somee.com/clanbattles"
    static let gamesUrl = baseUrl + "/v1/Games"
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