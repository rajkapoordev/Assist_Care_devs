//
//  FriendBookedCell.swift
//  AssistCare
//
//  Created by LaNet on 1/25/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class FriendBookedCell: UITableViewCell {
    
    @IBOutlet var imgFriend: UIImageView!
    @IBOutlet var imgSocialNW: UIImageView!
    @IBOutlet var lblFriendName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCellInterface() {
        imgFriend.layer.cornerRadius = imgFriend.layer.bounds.width/2
        imgFriend.clipsToBounds = true
        imgSocialNW.layer.cornerRadius -= imgSocialNW.layer.bounds.width/2
        imgSocialNW.clipsToBounds = true
        
    }
    
}
