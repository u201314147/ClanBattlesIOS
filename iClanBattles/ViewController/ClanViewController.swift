//
//  ClanViewController.swift
//  iClanBattles
//
//  Created by ALEXIS-PC on 10/23/18.
//  Copyright © 2018 ALEXIS-PC. All rights reserved.
//
import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

private let reuseIdentifier = "Cell"

class ClanViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var currentIndex: Int = 0
    var idcomunity: Int?
    let userDefaults = UserDefaults.standard
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var RankCollectionView: UICollectionView!

    var clans: [Clan] = [] {
        didSet {
            self.RankCollectionView.reloadData()
            self.RankCollectionView.collectionViewLayout.invalidateLayout()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //testNetworking()
        
        RankCollectionView.delegate = self
        RankCollectionView.dataSource = self
        
        updateClans()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testNetworking() {
        var xd = ClanBattlesService.gamesUrl + "/" + userDefaults.string(forKey: "id")! +  "/clans"
        Alamofire.request(xd)
            .responseJSON(completionHandler: {
                response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print("\(json)")
                    
                    var clans: [Clan] = []
                    let jsonClans = json["clans"].arrayValue
                    for i in 0...jsonClans.count - 1 {
                        clans.insert(Clan.init(from: jsonClans[i]), at: i)
                        print("\(clans[i].name)")
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
        return clans.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ClanCell
        
        // Configure the cell
        let clan = clans[indexPath.row]
        cell.updateValues(fromClan: clan)
        return cell
    }
    
    
    
    func updateClans() {
        var xd = ClanBattlesService.gamesUrl2 + "/1/clans"
        Alamofire.request(xd)
            .responseJSON(completionHandler: {
                response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print("\(json)")
                    let jsonClans = json["clans"].arrayValue
                    self.clans = Clan.from(jsonClans: jsonClans)
                case .failure(let error):
                    print(error)
                }
            })
        
    }
}

