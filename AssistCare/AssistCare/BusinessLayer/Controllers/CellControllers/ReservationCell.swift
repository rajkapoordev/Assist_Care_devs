//
//  ReservationCell.swift
//  AssistCare
//
//  Created by developer91 on 1/31/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class ReservationCell: UITableViewCell {

    
    @IBOutlet var lbCareGiverName: UILabel!
    @IBOutlet var lbReview: UILabel!
    @IBOutlet var lbTime: UILabel!
    @IBOutlet var lbCost: UILabel!
    @IBOutlet var lbAddress: UILabel!
    @IBOutlet var imgLocation: UIImageView!
    @IBOutlet var imgCareGiver: UIImageView!
    
    @IBOutlet var lbDay: UILabel!
    @IBOutlet var lbDate: UILabel!
    @IBOutlet var lbMonth: UILabel!
    @IBOutlet var viewCell: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
