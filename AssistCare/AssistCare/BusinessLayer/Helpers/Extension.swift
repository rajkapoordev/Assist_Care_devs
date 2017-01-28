//
//  Extension.swift
//  AssistCare
//
//  Created by developer91 on 1/16/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension UITextField {
    
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 1).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
extension UIButton{
    
    func shadow() {
    self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
    self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
    self.layer.shadowOpacity = 1.0
    self.layer.shadowRadius = 0.0
    self.layer.masksToBounds = false
    self.layer.cornerRadius = 4.0
    }
    
    func roundedBottomLeftButton(){
            let maskPAth1 = UIBezierPath(roundedRect: self.bounds,
                                         byRoundingCorners: [.bottomLeft ],
                                         cornerRadii:CGSize(width: 8.0, height: 8.0))
            let maskLayer1 = CAShapeLayer()
            maskLayer1.frame = self.bounds
            maskLayer1.path = maskPAth1.cgPath
            self.layer.mask = maskLayer1
    }
    
    func roundedBottomRightButton(){
        let maskPAth1 = UIBezierPath(roundedRect: self.bounds,
                                     byRoundingCorners: [.bottomRight ],
                                     cornerRadii:CGSize(width: 8.0, height: 8.0))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = self.bounds
        maskLayer1.path = maskPAth1.cgPath
        self.layer.mask = maskLayer1
    }
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

}
extension UIView {
    
    func setBottomBorderView() {
        
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 1).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
extension UITextField
{
    
    func isEmpty()->Bool
    {
        let trimmedString = self.text?.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        if trimmedString!.characters.count == 0
        {
            return true
        }
        return false
    }

}

