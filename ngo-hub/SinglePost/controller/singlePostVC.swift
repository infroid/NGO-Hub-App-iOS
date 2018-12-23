//
//  singlePostVC.swift
//  ngo-hub
//
//  Created by HIMALAYA  RAJPUT on 12/10/18.
//  Copyright © 2018 infroid. All rights reserved.
//

import UIKit

class singlePostVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //navigating back to recent activities
    @IBAction func sideMenuBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var tableView: UITableView!
    var post : recent?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "singlePostCell", bundle: nil), forCellReuseIdentifier: "singlePostCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 401
        
       
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "singlePostCell") as? singlePostCell{
            cell.titleLabel.text = post?.title!
            cell.dateLabel.text = post?.date!
            cell.descLabel.text = post?.description!
            cell.categoryBtn.setTitle(post?.category!, for: .normal)
            return cell
        }
        return UITableViewCell()
    }
    
    
    
    
}
