//
//  PublicatCell.swift
//  iClanBattles
//
//  Created by ALEXIS-PC on 10/23/18.
//  Copyright © 2018 ALEXIS-PC. All rights reserved.
//

import UIKit
import AlamofireImage

class PublicatCell : UICollectionViewCell {

    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var UserDescLabel: UILabel!
    @IBOutlet weak var UsernameLabel: UILabel!
    @IBOutlet weak var PublicationImage: UIImageView!
    @IBOutlet weak var UserPicImage: UIImageView!
    func updateValues(fromPublication publication: Publication) {
        if let url = URL(string: publication.urlToImage) {
            PublicationImage.af_setImage(withURL: url)
            UserPicImage.af_setImage(withURL: url)
        }
        UsernameLabel.text = publication.title
        UserDescLabel.text = publication.title
        DescriptionLabel.text = publication.description
    }
}
