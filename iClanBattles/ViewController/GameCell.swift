//
//  GameCell.swift
//  iClanBattles
//
//  Created by Anonimo on 8/10/18.
//  Copyright © 2018 ALEXIS-PC. All rights reserved.
//

import UIKit
import AlamofireImage
import Firebase
import GoogleSignIn

class GameCell : UICollectionViewCell {
    @IBOutlet weak var logoImageview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    //@IBOutlet weak var descriptionLabel: UILabel!
    
    func updateValues(fromGame game: Game) {
        if let url = URL(string: game.imageUrl) {
            logoImageview.af_setImage(withURL: url)
        }
        nameLabel.text = game.name
        //descriptionLabel.text = game.description
    }
}
