//
//  SearchResultCell.swift
//  AssistCare
//
//  Created by LaNet on 2/1/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {

    @IBOutlet var imgPin: UIImageView!
    
    @IBOutlet var lblTitle: UILabel!
    
    @IBOutlet var lblSubTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
