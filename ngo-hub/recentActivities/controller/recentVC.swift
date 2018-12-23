//
//  recentVC.swift
//  ngo-hub
//
//  Created by HIMALAYA  RAJPUT on 22/09/18.
//  Copyright © 2018 infroid. All rights reserved.
//

import UIKit

class recentVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    var recentArray = [recent]()
    
    @IBAction func sideMenuBtn(_ sender: Any) {
        let revealController = self.revealViewController() as! RevealViewController
        revealController.reveal(sender as AnyObject)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        //static data
        //replace it with api callback
        recentArray.append(recent(_title: "12 Strong", _date: "Posted on 19-11-2018", _category: "Deforestation", _description: "aafchacheba  habfheabhb abf vhabfvhb ahba h bah befh bahb hfb habfhbha hbabha", _imageUrl: ["deforestation.jpeg", "deforestation.jpeg", "deforestation.jpeg"]))
        recentArray.append(recent(_title: "12 Strong", _date: "Posted on 19-11-2018", _category: "Deforestation", _description: "aafchacheba  habfheabhb abf vhabfvhb ahba h bah befh bahb hfb habfhbha hbabha", _imageUrl: ["deforestation.jpeg", "deforestation.jpeg", "deforestation.jpeg"]))
        recentArray.append(recent(_title: "12 Strong", _date: "Posted on 19-11-2018", _category: "Deforestation", _description: "aafchacheba  habfheabhb abf vhabfvhb ahba h bah befh bahb hfb habfhbha hbabha", _imageUrl: ["deforestation.jpeg", "deforestation.jpeg", "deforestation.jpeg"]))
        recentArray.append(recent(_title: "12 Strong", _date: "Posted on 19-11-2018", _category: "Deforestation", _description: "aafchacheba  habfheabhb abf vhabfvhb ahba h bah befh bahb hfb habfhbha hbabha", _imageUrl: ["deforestation.jpeg", "deforestation.jpeg", "deforestation.jpeg"]))
        recentArray.append(recent(_title: "12 Strong", _date: "Posted on 19-11-2018", _category: "Deforestation", _description: "aafchacheba  habfheabhb abf vhabfvhb ahba h bah befh bahb hfb habfhbha hbabha", _imageUrl: ["deforestation.jpeg", "deforestation.jpeg", "deforestation.jpeg"]))
        recentArray.append(recent(_title: "12 Strong", _date: "Posted on 19-11-2018", _category: "Deforestation", _description: "aafchacheba  habfheabhb abf vhabfvhb ahba h bah befh bahb hfb habfhbha hbabha", _imageUrl: ["deforestation.jpeg", "deforestation.jpeg", "deforestation.jpeg"]))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "recentCell", bundle: nil), forCellReuseIdentifier: "recentCell")
        tableView.register(UINib(nibName: "recentCell1", bundle: nil), forCellReuseIdentifier: "recentCell1")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 342
        
        
    
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentArray.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "recentCell1") as? recentCell1{
            let recentObj = recentArray[indexPath.row]
            cell.titleLabel.text = recentObj.title
            cell.descLabel.text = recentObj.description
            cell.userImageView.image = UIImage(named: recentObj.imageUrl[0]!)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "recent", sender: indexPath.row)
    }
   
    @objc func readMoreBtnPressed(sender: UIButton){
       print(sender.tag)
        performSegue(withIdentifier: "singlePostVC", sender: sender.tag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recent"{
            if let row = sender as? Int
            {
                print(row)
                (segue.destination as! singleVC).post = self.recentArray[row]
            }
        }
    }
    


}
