//
//  PaymentDetailCell.swift
//  AssistCare
//
//  Created by LaNet on 1/21/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class PaymentCardDetailCell: UITableViewCell {
    
    @IBOutlet var imgPaymentCard: UIImageView!
    @IBOutlet var lblCardInfo: UILabel!
    @IBOutlet var imgSelected: UIImageView!
    
    @IBOutlet var vwBottomBorder: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
