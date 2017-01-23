//
//  CirtificateCell.swift
//  AssistCare
//
//  Created by LaNet on 1/23/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class CirtificateCell: UITableViewCell {

    @IBOutlet var txtExpDate: UITextField!
    @IBOutlet var vWStatus: UIView!
    
    @IBOutlet var btnStatus: UIButton!
    @IBAction func btnImgPic(_ sender: Any) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
