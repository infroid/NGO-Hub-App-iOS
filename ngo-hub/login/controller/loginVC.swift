//
//  loginVC.swift
//  ngo-hub
//
//  Created by HIMALAYA  RAJPUT on 19/09/18.
//  Copyright © 2018 infroid. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn
class loginVC: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate , FBSDKLoginButtonDelegate{
   
    
    @IBOutlet weak var googleSignInBtn: UIButton!{
        didSet{
            googleSignInBtn.addTarget(self, action: #selector(googleSignInBtnPressed), for: .touchUpInside)
        }
    }
    @IBOutlet weak var fbSignInBtn: UIButton!{
    didSet{
        fbSignInBtn.addTarget(self, action: #selector(fbLoginButtonClicked), for: .touchUpInside)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGoogleSignIn()
        // Do any additional setup after loading the view.
    }
    func configureGoogleSignIn(){
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = "891572041374-so6v161ap3nitct4fk470gira37pll8g.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
    }
    
    @objc func googleSignInBtnPressed(){
        GIDSignIn.sharedInstance().signIn()
    }
    @objc func fbLoginButtonClicked() {
         var fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self, handler: { (result, error) -> Void in
            if (error == nil){
                var fbloginresult : FBSDKLoginManagerLoginResult = result!
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getFBUserData()
                }
            }
        })
    }
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    
                    let res = result as! NSDictionary
                    if let picture = res["picture"] as? [String:Any] ,
                        let imgData = picture["data"] as? [String:Any] ,
                        let imgUrl = imgData["url"] as? String {
                        UserDefaults.standard.set(imgUrl, forKey: "user_image")
                        print(imgUrl)
                    }
                    print(res["email"]!)
                    UserDefaults.standard.set(res["email"], forKey: "email")
                    print(res["name"]!)
                    UserDefaults.standard.set(res["name"], forKey: "name")
                    self.moveToHome()
                }
            })
        }
    }

    
    func moveToHome(){
        performSegue(withIdentifier: "show_home", sender: nil)
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print(error)
            return
        }
        
        print(user.profile.email!)
        print(user.profile.name!)
        UserDefaults.standard.set(user.profile.email!, forKey: "email")
        UserDefaults.standard.set(user.profile.name!, forKey: "name")
        if user.profile.hasImage{
            // crash here !!!!!!!! cannot get imageUrl here, why?
            // let imageUrl = user.profile.imageURLWithDimension(120)
            let imageUrl = signIn.currentUser.profile.imageURL(withDimension: 120)
            UserDefaults.standard.set(imageUrl!, forKey: "user_image")
            print(" image url: ", imageUrl!)
        }
        self.moveToHome()    
    }
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("logged in suceesfully")
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logged out")
    }
    

}
