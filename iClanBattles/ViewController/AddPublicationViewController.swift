//
//  AddPublicationViewController.swift
//  iClanBattles
//
//  Created by ALEXIS-PC on 10/23/18.
//  Copyright © 2018 ALEXIS-PC. All rights reserved.
//

import Alamofire
import UIKit
import SwiftyJSON
class AddPublicationViewController: UIViewController {
    
    @IBOutlet weak var TitleTextView: UITextField!
    @IBOutlet weak var DescriptionTextView: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    @IBOutlet weak var PublishAction: UIButton!
    @IBAction func PublishButton(_ sender: UIButton) {
         requestToSendObject()
        self.dismiss(animated: true)
    }
    
    func requestToSendObject() {
        
        var textTitle: String = TitleTextView.text ?? "nani"
        var textDesc: String = DescriptionTextView.text ?? "nani"
        
        let userDefaults = UserDefaults.standard
        
        var url = "http://clanbattles.somee.com/clanbattles/v1/gamers/1/publications"
        let _headers : HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        let params : Parameters = ["gamerId":"2","gameId": userDefaults.string(forKey: "id")! ,"title": textTitle, "description": textDesc, "urlToImage": "https://fotos.subefotos.com/ade226bce9d3f9cf09fff2c40b622ab6o.png","publicationDate":"2018-09-23T00:00:00","status":"ACT"]
        
        _ =  NSURL(string:"url" as String)
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.httpBody , headers: _headers).responseJSON(completionHandler: {
            response in switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                print("\(json)")
                
                let jsonResponse = response.result.value as! NSDictionary
                
                self.dismiss(animated: true)
                
                
            case .failure(let error):
                print("GG?")
                print(error)
            }
            
            
        })
    }
    
    @IBAction func DoneButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    @IBAction func takeAPhotoAction(_ sender: UIBarButtonItem) {
        // Setup Image Picker
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        //Assign either Camera or Photo Library
        imagePicker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ?
            .camera : .photoLibrary
        //Present Image Picker to User
        present(imagePicker, animated:true)
        
    }
    
}
extension AddPublicationViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        // Close Image Picker
        picker.dismiss(animated: true)
        //Update Image View with selected or captured Image
        photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Close Image Picker
        picker.dismiss(animated: true)
        photoImageView.image = UIImage(named: "noimage")
        
        
        
        
        
    }
}
