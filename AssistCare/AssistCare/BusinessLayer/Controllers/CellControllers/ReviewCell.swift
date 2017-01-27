//
//  ReviewCell.swift
//  AssistCare
//
//  Created by Developer49 on 1/27/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet var imgUser: UIImageView!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblReviewTxt: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
