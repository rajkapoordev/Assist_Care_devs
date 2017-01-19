//
//  AppDesign.swift
//  StyleAgainApp
//
//  Created by Devloper30 on 05/11/16.
//  Copyright © 2016 Sonal. All rights reserved.
//

import Foundation
import UIKit

func getFontColor() -> UIColor{
    return appUIColorFromRGB(rgbValue: FONT_COLOR, alpha: 1)
}

func  getInfoFontColor() -> UIColor{
    return appUIColorFromRGB(rgbValue: INFO_FONT_COLOR, alpha: 1)
}

func getAppColor() -> UIColor{
        return appUIColorFromRGB(rgbValue: APP_COLOR, alpha: 1)
}


func getBackgroundColor() -> UIColor {
    return appUIColorFromRGB(rgbValue: BACK_COLOR, alpha: 1)
}

func getGrayColor()->UIColor{
    return appUIColorFromRGB(rgbValue: GRAY_COLOR, alpha: 1)
}

func getGreenColor()->UIColor{
    return appUIColorFromRGB(rgbValue: GREEN_COLOR, alpha: 1)
}

func getRedColor()->UIColor{
    return appUIColorFromRGB(rgbValue: RED_COLOR, alpha: 1)
}
/*func SAAppFontRegular(x:CGFloat) -> UIFont {
    return UIFont(name: "OpenSans", size: x)!
}

func SAAppFontSemiBold(x:CGFloat) -> UIFont {
    return UIFont(name: "OpenSans-SemiBold", size: x)!
}*/

//Controller design

func appTextField(textField:UITextField) -> UITextField{
    textField.backgroundColor = appUIColorFromRGB(rgbValue: BACK_COLOR, alpha: 1)
    textField.layer.borderColor = nil
    return textField
}

func appButton(appButton:UIButton,backColor:UIColor,textColor:UIColor,radius:Bool,
               borderWidth:CGFloat,borderColor:UIColor) -> UIButton {
    
    appButton.backgroundColor = backColor
    appButton.layer.borderWidth = borderWidth
    appButton.layer.borderColor = borderColor.cgColor
    appButton.setTitleColor(textColor, for: UIControlState.normal)
    if(radius)
    {
        //   print(appButton.frame)
        //  appButton.layer.cornerRadius = appButton.frame.size.height/2
        appButton.layer.cornerRadius = 25
    }
    return appButton
}

func appUIColorFromRGB(rgbValue: UInt,alpha:Double) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(alpha)
    )
}

func imageWithImage(_ image: UIImage, scaledToSize newSize: CGSize) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
    image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
    let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return newImage
}

class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 5);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}


