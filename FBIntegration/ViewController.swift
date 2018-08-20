//
//  ViewController.swift
//  FBIntegration
//
//  Created by Sierra on 8/19/18.
//  Copyright © 2018 Nagiz. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController,FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var statusLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let FBButton = FBSDKLoginButton()
        FBButton.readPermissions = ["public_profile","email"]
        FBButton.delegate = self
        FBButton.center = self.view.center
        self.view.addSubview(FBButton)
        
        if FBSDKAccessToken.current() != nil{
            statusLbl.text = "LOGGED IN"
        }else{
            statusLbl.text = "NOT LOGGED IN"
        }
    }

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            statusLbl.text = error.localizedDescription
        }else if result.isCancelled {
            statusLbl.text = "user cancelled login"
        }else{
            statusLbl.text = "user logged in"
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        statusLbl.text = "user logged out"
    }
}

