//
//  splashVC.swift
//  ngo-hub
//
//  Created by HIMALAYA  RAJPUT on 22/09/18.
//  Copyright © 2018 infroid. All rights reserved.
//

import UIKit

class splashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
       startTimer()
    }

    var timer: Timer?
    
    func startTimer() {
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(moveToView), userInfo: nil, repeats: true)
        }
    }
    
    func stopTimer() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    
    @objc func moveToView(){
        var first: Bool?
       if let first_time = UserDefaults.standard.value(forKey: "first_time") as? Bool{
        first = first_time
        }
       else{
        first = false
        UserDefaults.standard.set(false, forKey: "first_time")
        }
        if !first!{
            print("Intro")
            self.performSegue(withIdentifier: "show_intro", sender: nil)
        }else{
        if let email = UserDefaults.standard.value(forKey: "email") as? String{
            print("Home")
            self.performSegue(withIdentifier: "show_home", sender: nil)
        }
        else{
            print("login")
            self.performSegue(withIdentifier: "show_login", sender: nil)
        }
    }
        
         self.stopTimer()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
