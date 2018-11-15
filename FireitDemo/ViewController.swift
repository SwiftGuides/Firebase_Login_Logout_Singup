//
//  ViewController.swift
//  FireitDemo
//
//  Created by MacMini on 10/31/18.
//  Copyright © 2018 com.thisislit. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var fcmTokenID: UILabel!
    
    @IBOutlet weak var instanceTokenID: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(self.displayFCMToken(notification:)),
                                               name: Notification.Name("FCMToken"), object: nil)
        
    }
    
    @objc func displayFCMToken(notification: NSNotification){
        guard let userInfo = notification.userInfo else {return}
        if let fcmToken = userInfo["token"] as? String {
            self.fcmTokenID.text = "Received FCM token: \(fcmToken)"
        }
    }
    
    
    @IBAction func btnNotification(_ sender: Any) {
        
        // [START subscribe_topic]
        Messaging.messaging().subscribe(toTopic: "weather") { error in
            print("Subscribed to weather topic")
        }
        // [END subscribe_topic]
        
    }
    
    @IBAction func btnLogToken(_ sender: Any) {
        
        // [START log_fcm_reg_token]
        let token = Messaging.messaging().fcmToken
        print("FCM token: \(token ?? "")")
        // [END log_fcm_reg_token]
        self.fcmTokenID.text  = "Logged FCM token: \(token ?? "")"
        
        // [START log_iid_reg_token]
        InstanceID.instanceID().instanceID { (result, error) in
            if let error = error {
                print("Error fetching remote instange ID: \(error)")
            } else if let result = result {
                print("Remote instance ID token: \(result.token)")
                self.instanceTokenID.text  = "Remote InstanceID token: \(result.token)"
            }
        }
        // [END log_iid_reg_token]
    }

    
    
}

