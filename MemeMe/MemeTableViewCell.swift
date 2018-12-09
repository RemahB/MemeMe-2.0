//
//  view.swift
//  MemeMe
//
//  Created by Remah on 01/12/2018.
//  Copyright © 2018 MAC. All rights reserved.
//

import Foundation
import UIKit

class MemeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var memeImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    var meme: Meme?
    
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
