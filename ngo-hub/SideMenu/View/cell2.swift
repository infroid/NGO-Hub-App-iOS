//
//  cell2.swift
//  homeguardv2
//
//  Created by Kunwar Anirudh Singh on 22/01/18.
//  Copyright © 2018 Homeguard Securities. All rights reserved.
//

import UIKit

class cell2: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!{
        didSet{
            iconImage.layer.cornerRadius = 16
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
