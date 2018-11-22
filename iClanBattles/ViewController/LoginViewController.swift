//
//  LoginViewController.swift
//  iClanBattles
//
//  Created by Luis Jeffrey Rojas Montes on 7/11/18.
//  Copyright © 2018 ALEXIS-PC. All rights reserved.
//

import Foundation
import GoogleSignIn
import SVProgressHUD

class LoginViewController : UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var googleSignInButton: GIDSignInButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var boxView: UIView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
   
    
    @IBAction func logInTouchDown(_ sender: UIButton) {
        let username = usernameTextField.text as String?
        let password = passwordTextField.text as String?
        if(username == "cliente" && password == "cliente") {
            SVProgressHUD.show(withStatus: "Login is processing...")
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) { // change 4 to desired number of seconds
                // Your code with delay
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "showMain", sender: self)
            }
        }
        else {
            SVProgressHUD.showError(withStatus: "Invalid Login")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
        GIDSignIn.sharedInstance().uiDelegate = self
        self.boxView.layer.cornerRadius = 5
        
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }
    
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
