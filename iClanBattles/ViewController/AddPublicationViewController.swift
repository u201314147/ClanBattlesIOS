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
import Firebase
import FirebaseStorage

class AddPublicationViewController: UIViewController {
    
    @IBOutlet weak var TitleTextView: UITextField!
    @IBOutlet weak var DescriptionTextView: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var imagePicker: UIImagePickerController!
    var downloadString: String = ""
    var imagenSubir: UIImage?
    @IBOutlet weak var PublishAction: UIButton!
    @IBAction func PublishButton(_ sender: UIButton) {
        uploadImagePic(img1: imagenSubir!)
       //     requestToSendObject(from: downloadString)
        self.dismiss(animated: true)
    }
    
    func uploadImagePic(img1 :UIImage){
        var data = NSData()
        data = UIImageJPEGRepresentation(img1, 0.8)! as NSData
        // set upload path
        let uuid = NSUUID().uuidString.lowercased()
       let filePath = "image/\(uuid)" // path where you wanted to store img in storage
        let metaData = StorageMetadata()
        
        
        metaData.contentType = "image/jpg"
        
        
        
        var storageRef = Storage.storage().reference()
        storageRef.child(filePath).putData(data as Data, metadata: metaData){(metaData,error) in
            if let error = error {
                print(error.localizedDescription)
                print("gg kevin no subio backend")
                return
            }else{
                print("gg kevin si subio backend")
                //store downloadURL
                
                storageRef.downloadURL { url, error in
                    if let error = error {
                        // Handle any errors
                    } else {
                        self.downloadString = url?.absoluteString ?? "gg"
                        //self.requestToSendObject(from: downloadString)
                        print("se subio")
                    }
                }
                
                
                /*let downloadURL = metaData!.storageReference?.downloadURL(completion: { (url, error) in
                    if (error == nil) {
                        if let downloadUrl = url {
                            // Make you download string
                            self.downloadString = downloadUrl.absoluteString
                            //self.requestToSendObject(from: downloadString)
                             print("se subio")
                        }
                     } else {
                        print("gg imagen")
                    }
                })
           */
                print("wenas")
                
            }
        }
        
    }
    func requestToSendObject(from url: String) {
        
        var textTitle: String = TitleTextView.text ?? "nani"
        var textDesc: String = DescriptionTextView.text ?? "nani"
        
        let userDefaults = UserDefaults.standard
        
        var url = "http://clanbattles.somee.com/clanbattles/v1/gamers/1/publications"
        let _headers : HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        let params : Parameters = ["gamerId":"2","gameId": userDefaults.string(forKey: "id")! ,"title": textTitle, "description": textDesc, "urlToImage": url	,"publicationDate":"2018-09-23T00:00:00","status":"ACT"]
        
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
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        //uploadImagePic(img1: image!)
        imagenSubir = image
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Close Image Picker
        picker.dismiss(animated: true)
        photoImageView.image = UIImage(named: "noimage")
        
        
        
        
        
    }
}
