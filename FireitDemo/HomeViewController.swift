//
//  HomeViewController.swift
//  FireitDemo
//
//  Created by MacMini on 11/2/18.
//  Copyright © 2018 com.thisislit. All rights reserved.
//

import UIKit


enum loginThrough {
    case phone
    case email
}

let phoneTry = loginThrough.phone
let emailTry = loginThrough.email

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    @IBAction func phoneLoginButton(_ sender: Any) {
    
        
    }
    

    @IBAction func emailLoginButton(_ sender: Any) {
        
        let loginPhoneVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(loginPhoneVC, animated: true)
        
    }
    

}
