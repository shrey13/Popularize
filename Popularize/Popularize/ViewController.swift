//
//  ViewController.swift
//  Popularize
//
//  Created by Shreyash Agrawal on 12/12/15.
//  Copyright © 2015 popularizeapp. All rights reserved.
//

import UIKit
import Parse
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let testObject = PFObject(className: "TestObject")
//        testObject["foo"] = "bar"
//        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
//            print("Object has been saved.")
//        }
        if FBSDKAccessToken.currentAccessToken() != nil {
            // user already has access token
            self.logUserData()
        } else {
            let loginButton = FBSDKLoginButton()
            loginButton.center = self.view.center
            loginButton.readPermissions = ["public_profile", "user_photos"]
            self.view.addSubview(loginButton)
            loginButton.delegate = self
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        self.logUserData()
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("logged in")
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("logged out")
    }
    
    func logUserData() {
        let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler { (connection, result, error) -> Void in
            if error != nil {
                print(error)
            } else {
                print(result)
            }
        }
    }

}

