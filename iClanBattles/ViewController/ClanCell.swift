//
//  ClanCell.swift
//  iClanBattles
//
//  Created by ALEXIS-PC on 10/23/18.
//  Copyright © 2018 ALEXIS-PC. All rights reserved.
//

import Foundation

import UIKit
import AlamofireImage

class ClanCell : UICollectionViewCell {
    @IBOutlet weak var LogoClan: UIImageView!
    
    @IBOutlet weak var NameClan: UILabel!
    func updateValues(fromClan clan: Clan) {
    if let url = URL(string: clan.urlToImage) {
     LogoClan.af_setImage(withURL: url)

    }
 NameClan.text = clan.name
 
}
}
