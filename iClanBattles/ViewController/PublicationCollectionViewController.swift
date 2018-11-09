//
//  PublicationCollectionViewController.swift
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

class PublicationCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
 var currentIndex: Int = 0
    
    let userDefaults = UserDefaults.standard
    
    var idcomunity: Int?

    @IBOutlet weak var publicationColletionView: UICollectionView!
    var publications: [Publication] = [] {
        didSet {
           self.publicationColletionView.reloadData()
        self.publicationColletionView.collectionViewLayout.invalidateLayout()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //testNetworking()
        
        publicationColletionView.delegate = self
        publicationColletionView.dataSource = self
        
        updatePublications()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testNetworking() {
        var xd = ClanBattlesService.gamesUrl + "/" + userDefaults.string(forKey: "id")! + "/publications"
        Alamofire.request(xd)
            .responseJSON(completionHandler: {
                response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print("\(json)")
                    
                    var publications: [Publication] = []
                    let jsonPublications = json["publications"].arrayValue
                    for i in 0...jsonPublications.count - 1 {
                        publications.insert(Publication.init(from: jsonPublications[i]), at: i)
                        print("\(publications[i].title)")
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
        return publications.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PublicatCell
        
        // Configure the cell
        let publication = publications[indexPath.row]
        cell.updateValues(fromPublication: publication)
        return cell
    }
    
   
    
    func updatePublications() {
        var xd = ClanBattlesService.gamesUrl + "/" + userDefaults.string(forKey: "id")! + "/publications"
        Alamofire.request(xd)
            .responseJSON(completionHandler: {
                response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print("\(json)")
                    var jsonPublications = json["publications"].arrayValue
                    jsonPublications = jsonPublications.reversed()
                    self.publications = Publication.from(jsonPublications: jsonPublications)
                case .failure(let error):
                    print(error)
                }
            })
        
    }
}

