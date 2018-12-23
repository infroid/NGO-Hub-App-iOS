//
//  cell1.swift
//  homeguardv2
//
//  Created by Kunwar Anirudh Singh on 22/01/18.
//  Copyright © 2018 Homeguard Securities. All rights reserved.
//

import UIKit

class cell1: UITableViewCell {
    let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
    
    
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var userImage: UIImageView!{
        didSet{
            userImage.clipsToBounds = true
            userImage.layer.cornerRadius = 50.0
            userImage.layer.borderWidth = 5.0
            userImage.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBOutlet weak var userNameLabel: UILabel!
   @IBOutlet weak var userEmailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


        // Configure the view for the selected state
    }
    
    
}
