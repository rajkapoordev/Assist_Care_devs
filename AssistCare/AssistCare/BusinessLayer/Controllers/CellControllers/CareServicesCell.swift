//
//  CareServicesCell.swift
//  AssistCareOnDemand
//
//  Created by LaNet on 1/17/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class CareServicesCell: UICollectionViewCell {

    @IBOutlet var imgMark: UIImageView!
    @IBOutlet var vWMark: UIView!
    @IBOutlet var vWServices: UIView!
    @IBOutlet var imgServices: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgServices.setRounded()
        // Initialization code
    }

}
