//
//  menuVC.swift
//  homeguardv2
//
//  Created by Kunwar Anirudh Singh on 22/01/18.
//  Copyright © 2018 Homeguard Securities. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn

class menuVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {
   
    var revealController: RevealViewController?
    var profileImg: String!
    var userName: String! = "UserName"
    var userEmail: String! = "UserEmail"
    let title1 = ["Create Request","Recent Activities"]
    let title2 = ["Log Out"]
    let imageArr = [["home.png","report_icon.png"],["exit.png"]]
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        revealController = self.revealViewController() as? RevealViewController
        tableView.register(UINib(nibName: "cell1", bundle: nil), forCellReuseIdentifier: "cell1")
        tableView.register(UINib(nibName: "cell2", bundle: nil), forCellReuseIdentifier: "cell2")
        tableView.register(UINib(nibName: "headerCell", bundle: nil), forCellReuseIdentifier: "headerCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.sectionFooterHeight = 0
        tableView.delegate=self
        tableView.dataSource=self
        if let image = UserDefaults.standard.value(forKey: "user_image") as? String{
            profileImg = image
        }
        if let name = UserDefaults.standard.value(forKey: "name") as? String{
            userName = name
        }
        if let email = UserDefaults.standard.value(forKey: "email") as? String{
            userEmail = email
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else if section == 1{
            return title1.count
        }else if section == 2{
            return title2.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return UITableViewAutomaticDimension;
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 || section == 3{
        return UITableViewAutomaticDimension
        }
        else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section{
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? headerCell{
                cell.headerLabel.text = "Logout"
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? headerCell{
                cell.headerLabel.text = "Tools"
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let navController = UINavigationController()
        let revealController = SWRevealViewController()
        revealController.rightViewController = navController
        revealController.revealToggle(animated: true)
    revealController.rightViewController.view.addGestureRecognizer(revealController.panGestureRecognizer())
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as? cell1{
                cell.userImage.image = UIImage(named: "man.png")
                if profileImg != nil{
                    cell.userImage.imageFromServerURL(urlString: profileImg, PlaceHolderImage: UIImage(named: "man.png")!)
                }
                
                
                cell.userNameLabel.text = userName
                cell.userEmailLabel.text = userEmail
                return cell
            }
        }
        else if indexPath.section == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as? cell2 {
                cell.iconImage.image  = UIImage(named: imageArr[indexPath.section - 1 ][indexPath.row])
                cell.iconImage.setImageColor(color: UIColor.darkGray)
                cell.titleLabel.text = title1[indexPath.row]
                return cell
            }
        }
        else if indexPath.section == 2 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as? cell2 {
                cell.iconImage.image  = UIImage(named: imageArr[indexPath.section - 1][indexPath.row])
                cell.iconImage.setImageColor(color: UIColor.darkGray)
                cell.titleLabel.text = title2[indexPath.row]
                return cell
            }
        }
        
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controller: UIViewController!
        var navController : UINavigationController!
        if indexPath.section == 0{
            if indexPath.row == 0 {
               
            }
        }
        else if indexPath.section == 1{
            switch indexPath.row{
                case 0:
                    controller = storyboard.instantiateViewController(withIdentifier: "homeVC") as! homeVC
                    navController = UINavigationController(rootViewController: controller)
                    revealController = self.revealViewController() as? RevealViewController
                    revealController?.rightViewController = navController
                    revealController?.reveal(self)
                revealController?.rightViewController.view.addGestureRecognizer((revealController?.panGestureRecognizer())!)
            case 1:
                controller = storyboard.instantiateViewController(withIdentifier: "recentVC") as! recentVC
                navController = UINavigationController(rootViewController: controller)
                revealController = self.revealViewController() as? RevealViewController
                revealController?.rightViewController = navController
                revealController?.reveal(self)
                revealController?.rightViewController.view.addGestureRecognizer((revealController?.panGestureRecognizer())!)
                default:
                    print("Invalid Case")
                }
            
        }else if indexPath.section == 2{
            switch indexPath.row{
            case 0:
                logout()
            default:
                print("Invalid Case")
            }
        }
        
    }
    
    func logout(){
        print("logout")
        if GIDSignIn.sharedInstance().hasAuthInKeychain() {
        GIDSignIn.sharedInstance().signOut()
        
        }else{
            print("Logout fb")
            print(FBSDKAccessToken.current())
            FBSDKLoginManager().logOut()
        }
        UserDefaults.standard.set(nil, forKey: "email")
        UserDefaults.standard.set(nil, forKey: "name")
        UserDefaults.standard.set(nil, forKey: "user_image")
        performSegue(withIdentifier: "logout", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



