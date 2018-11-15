//
//  LoginViewController.swift
//  FireitDemo
//
//  Created by MacMini on 11/2/18.
//  Copyright © 2018 com.thisislit. All rights reserved.
//

import UIKit
import FirebaseAuth



class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.statusLabel.text = "Status"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButton(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
            if let firebaseError = error {
                
                self.statusLabel.text = firebaseError.localizedDescription
            }
            else {
                let userID = Auth.auth().currentUser!.uid
                self.statusLabel.text = "Log in Successfull"
                print("user", userID )
                
            }
        }
        
        
        
    }
    
    @IBAction func signOutButton(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.statusLabel.text = "Logged Out"
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        
    }
    
}
