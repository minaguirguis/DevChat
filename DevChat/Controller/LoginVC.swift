//
//  LoginVC.swift
//  DevChat
//
//  Created by Mina Guirguis on 5/23/18.
//  Copyright © 2018 Mina Guirguis. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: RoundTextField!
    @IBOutlet weak var passwordField: RoundTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func loginPressed(_ sender: Any) {
        if let email = emailField.text, let pass = passwordField.text, (email.characters.count > 0 && pass.characters.count > 0) {//making sure its not nil or empty string
            
            AuthService.instance.login(email: email, password: pass)
            
        } else {
            let alert = UIAlertController(title: "Username and Password Required", message: "You must enter both a username and password to login", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))//to close alert
            
            present(alert, animated: true, completion: nil)
        }
    }
}
