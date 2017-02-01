//
//  CareGiverAgendaCell.swift
//  AssistCare
//
//  Created by LaNet on 1/31/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class CareGiverAgendaCell: UITableViewCell {

    @IBOutlet var btnMsg: UIButton!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var imgProfile: UIImageView!
    
    @IBOutlet var lblTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgProfile.setRounded()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
