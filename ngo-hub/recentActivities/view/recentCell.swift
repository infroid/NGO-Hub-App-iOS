//
//  recentCell.swift
//  ngo-hub
//
//  Created by HIMALAYA  RAJPUT on 23/09/18.
//  Copyright © 2018 infroid. All rights reserved.
//

import UIKit

class recentCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var categoryBtn: UIButton!
    
    @IBOutlet weak var readMoreBtn: UIButton!
    @IBOutlet weak var userImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
