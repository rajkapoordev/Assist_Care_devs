//
//  MedicationPrompt.swift
//  AssistCare
//
//  Created by LaNet on 1/31/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class MedicationPrompt: UITableViewCell {

    @IBOutlet var imgStatus: UIImageView!
    
    @IBOutlet var btnCkeck: UIButton!
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
