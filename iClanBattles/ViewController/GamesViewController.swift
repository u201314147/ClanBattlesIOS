//
//  ViewController.swift
//  Test
//
//  Created by ALEXIS-PC on 9/1/18.
//  Copyright © 2018 ALEXIS-PC. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

private let reuseIdentifier = "Cell"

class GamesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var currentIndex: Int = 0
    @IBOutlet var gamesCollectionView: UICollectionView!
    
    var games: [Game] = [] {
        didSet {
            self.gamesCollectionView.reloadData()
            self.gamesCollectionView.collectionViewLayout.invalidateLayout()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //testNetworking()
        
        gamesCollectionView.delegate = self
        gamesCollectionView.dataSource = self
        
        updateGames()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func testNetworking() {
        Alamofire.request(ClanBattlesService.gamesUrl)
        .responseJSON(completionHandler: {
            response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("\(json)")
                
                var games: [Game] = []
                let jsonGames = json["games"].arrayValue
                for i in 0...jsonGames.count - 1 {
                    games.insert(Game.init(from: jsonGames[i]), at: i)
                    print("\(games[i].name)")
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GameCell
        
        // Configure the cell
        let game = games[indexPath.row]
        cell.updateValues(fromGame: game)
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*if segue.identifier == "showComunity" {
            let tabUIcontroller = (segue.destination as! UITabBarController).viewControllers?.first as! TabBarViewController
            tabUIcontroller.idcomunity = games[currentIndex].id
            
        }*/
        let userDefaults = UserDefaults.standard
        userDefaults.set(String(games[currentIndex].id), forKey: "id")
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentIndex = indexPath.row
        performSegue(withIdentifier: "showComunity", sender: self)
    }
    func updateGames() {
        Alamofire.request(ClanBattlesService.gamesUrl)
            .responseJSON(completionHandler: {
                response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print("\(json)")
                    let jsonGames = json["games"].arrayValue
                    self.games = Game.from(jsonGames: jsonGames)
                case .failure(let error):
                    print(error)
                }
            })
        
    }
}

