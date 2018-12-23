//
//  recent.swift
//  ngo-hub
//
//  Created by HIMALAYA  RAJPUT on 12/10/18.
//  Copyright © 2018 infroid. All rights reserved.
//

import Foundation


class recent {
    var title : String?
    var date : String?
    var category : String?
    var description : String?
    var imageUrl : [String?]
    
    init(_title: String, _date: String, _category: String, _description: String, _imageUrl: [String]) {
        self.title = _title
        self.date = _date
        self.category = _category
        self.description = _description
        self.imageUrl = _imageUrl
    }
}
