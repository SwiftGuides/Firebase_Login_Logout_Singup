//
//  SignupViewController.swift
//  FireitDemo
//
//  Created by MacMini on 11/2/18.
//  Copyright © 2018 com.thisislit. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {

    
    @IBOutlet weak var emailFieldSignup: UITextField!
    @IBOutlet weak var passwordFieldSignup: UITextField!
    
    @IBOutlet weak var statusLabelSignup: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupButton(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: emailFieldSignup.text!, password: passwordFieldSignup.text!) { (user, error) in
            
            if let FIRError = error {
                
                self.statusLabelSignup.text = FIRError.localizedDescription
            }
            else{
                self.statusLabelSignup.text = "SignUp Successfull"
            }
        }

}
}
