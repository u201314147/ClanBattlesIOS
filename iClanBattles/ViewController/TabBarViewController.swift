//
//  TabBarViewController.swift
//  iClanBattles
//
//  Created by ALEXIS-PC on 10/23/18.
//  Copyright © 2018 ALEXIS-PC. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    var idcomunity: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func DoneButton(_ sender: UIBarButtonItem) {
         self.dismiss(animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
      /*  if segue.identifier == "Publications" {
            let publicController = (segue.destination as! UINavigationController).viewControllers.first as! PublicationCollectionViewController
            publicController.idcomunity = self.idcomunity
            
        }
    
        if segue.identifier == "View Controller" {
            let clanController = (segue.destination as! UINavigationController).viewControllers.first as! ClanViewController
            clanController.idcomunity = self.idcomunity
            
        }*/
    }
  

}
