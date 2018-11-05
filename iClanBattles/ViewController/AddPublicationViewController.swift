//
//  AddPublicationViewController.swift
//  iClanBattles
//
//  Created by ALEXIS-PC on 10/23/18.
//  Copyright © 2018 ALEXIS-PC. All rights reserved.
//


import UIKit

class AddPublicationViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
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
