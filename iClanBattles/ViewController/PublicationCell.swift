//
//  PublicationCell.swift
//  iClanBattles
//
//  Created by ALEXIS-PC on 10/23/18.
//  Copyright © 2018 ALEXIS-PC. All rights reserved.
//
import UIKit
import AlamofireImage

class PublicationCell : UICollectionViewCell {

    func updateValues(fromPublication publication: Publication) {
        if let url = URL(string: publication.urlToImage) {
            //  logoImageview.af_setImage(withURL: url)
        }
        // nameLabel.text = game.name
        //descriptionLabel.text = game.description
}
}
