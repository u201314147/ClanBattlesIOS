//
//  ClanBattlesStore.swift
//  iClanBattles
//
//  Created by ALEXIS-PC on 10/23/18.
//  Copyright © 2018 ALEXIS-PC. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ClanBattlesStore {
    let delegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate)
       .persistentContainer.viewContext
   let favoriteEntityName = "Favorite"
    
    func save() {
   //     delegate.saveContext()
    }
    
    func addFavorite(for game: Game) {
        let entityDescription = NSEntityDescription.entity(
            forEntityName: favoriteEntityName,
            in: context)
        let favorite = NSManagedObject(
            entity: entityDescription!,
            insertInto: context)
        favorite.setValue(game.id, forKey: "gameId")
        favorite.setValue(game.name, forKey: "gameName")
        save()
    }
    
    func deleteFavorite(for game: Game) {
        if let objectId = findFavoriteById(for: game)?.objectID {
            let request = NSBatchDeleteRequest(objectIDs: [objectId])
            do {
                try context.execute(request)
                save()
            } catch let error {
                print("Delete Error: \(error.localizedDescription)")
            }
        }
    }
    
    func findFavoriteBy(predicate: NSPredicate, for game: Game) -> NSManagedObject? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: favoriteEntityName)
        request.predicate = predicate
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            return result.first as? NSManagedObject
        } catch let error {
            print("Query Error: \(error.localizedDescription)")
        }
        return nil
    }
    
    
    func findFavoriteById(for game: Game) -> NSManagedObject? {
        let predicate = NSPredicate(format: "gameId = %@", game.id)
        return findFavoriteBy(predicate: predicate, for: game)
    }
    
    func findFavoriteByName(for game: Game) -> NSManagedObject? {
        let predicate = NSPredicate(format: "gameName = %@", game.name)
        return findFavoriteBy(predicate: predicate, for: game)
    }
    
    
    func findAllFavorites() -> [NSManagedObject]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: favoriteEntityName)
        do {
            let result = try context.fetch(request)
            return result as? [NSManagedObject]
            
        } catch let error {
            print("Query Error: \(error.localizedDescription)")
        }
        return nil
    }
    
    func isFavorite(game: Game) -> Bool {
        return findFavoriteById(for: game) != nil
    }
    
    func favorite(game: Game) {
        setFavorite(true, for: game)
    }
    
    func unFavorite(game: Game) {
        setFavorite(false, for: game)
    }
    
    func setFavorite(_ isFavorite: Bool, for game: Game) {
        if self.isFavorite(game: game) == isFavorite {
            return
        }
        if isFavorite {
            addFavorite(for: game)
        } else {
            deleteFavorite(for: game)
        }
    }
    
    func favoriteSourceIdsAsString() -> String {
        if let favorites = findAllFavorites() {
            return favorites.map({ $0.value(forKey: "gameId") as! String })
                .filter({ !$0.isEmpty })
                .prefix(20)
                .joined(separator: ",")
        }
        return ""
    }
}

