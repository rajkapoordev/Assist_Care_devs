//
//  PersonHistoryCell.swift
//  AssistCare
//
//  Created by LaNet on 1/20/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class PersonHistoryCell: UITableViewCell {

    @IBOutlet var imgPerson: UIImageView!
    @IBOutlet var lblEarnAmount: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblEmailId: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInterface() {
        self.lblEmailId.textColor = appUIColorFromRGB(rgbValue: FONT_COLOR, alpha: 1.0)
        self.imgPerson.layer.cornerRadius = self.imgPerson.bounds.size.width * 0.5
        self.imgPerson.clipsToBounds = true
    }
    
}
