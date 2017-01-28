//
//  ReferenceCell.swift
//  AssistCare
//
//  Created by LaNet on 1/28/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class ReferenceCell: UITableViewCell {

    @IBOutlet var lblTitle: UILabel!
    
    @IBOutlet var btnPickImg: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
