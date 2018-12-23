//
//  thirdVC.swift
//  ngo-hub
//

//  Copyright © 2018 infroid. All rights reserved.
//

import UIKit

class thirdVC: UIViewController {

    
    var timer: Timer?
    
    func startTimer() {
        //timer to set duration of splash screen
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToView), userInfo: nil, repeats: true)
        }
    }
    
    func stopTimer() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(true, forKey: "first_time")
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        startTimer()
    }
    //to navgate to login view controller
    @objc func moveToView(){
                print("login")
                self.performSegue(withIdentifier: "show_login", sender: nil)
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
