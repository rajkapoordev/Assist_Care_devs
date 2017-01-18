//
//  cellMedication.swift
//  AssistCare
//
//  Created by developer91 on 1/17/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class cellMedication: UITableViewCell {

    @IBOutlet var btnDelete: UIButton!
    @IBOutlet var lbMedicationTime: UILabel!
    @IBOutlet var lbMedicationName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        btnDelete.setBackgroundImage(imageWithImage(#imageLiteral(resourceName: "deleteMedication"), scaledToSize: CGSize(width: btnDelete.bounds.size.width, height: btnDelete.bounds.size.height)), for: .normal)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
