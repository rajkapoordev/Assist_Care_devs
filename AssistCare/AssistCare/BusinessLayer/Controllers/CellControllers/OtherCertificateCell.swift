//
//  OtherCertificateCell.swift
//  AssistCare
//
//  Created by LaNet on 1/27/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class OtherCertificateCell: UITableViewCell {

    @IBOutlet var txtCertificateName: UITextField!
    
    @IBOutlet var vWStatus: UIView!
    @IBOutlet var btnPickCertiClick: UIButton!
    @IBOutlet var txtExpDate: UITextField!
    @IBOutlet var btnStatus: UIButton!
    @IBOutlet var txtProvider: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        txtExpDate.setBottomBorder()
        txtProvider.setBottomBorder()
        txtCertificateName.setBottomBorder()
        vWStatus.setBottomBorderView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
