//
//  Constant.swift
//  AssistCare
//
//  Created by developer91 on 1/16/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import Foundation
import UIKit

//let FONT_COLOR:UInt = 0x6D6D6D
//let INFO_FONT_COLOR:UInt = 0x6F7179
//let APP_COLOR:UInt = 0xE44754 //App red color
//let SILVER_COLOR:UInt = 0xF2F2F2
let BACK_COLOR:UInt = 0xEEEEEE //textFieldBackColor
//let GRAY_COLOR:UInt = 0xE0E0E0
//let GREEN_COLOR:UInt = 0x46BCD0 // app green color
//let RED_COLOR:UInt = 0xDC454B //0xF07374

// define for user role
let patient = "Patient"
let careGiver = "CareGiver"

func appDelegate() -> AppDelegate {
    return (UIApplication.shared.delegate as! AppDelegate)
}

func heightForView(text: String, font: UIFont, width: CGFloat) -> CGFloat {
    let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
    label.font = font
    label.text = text
    label.sizeToFit()
    return label.frame.height
}

struct AppColor {
    static let redColor = UIColor(red: 221/255, green: 55/255, blue: 66/255, alpha: 1.0)
    static let skyColor = UIColor(red: 54/255, green: 174/255, blue: 197/255, alpha: 1.0)
    static let greenColor = UIColor(red: 58/255, green: 173/255, blue: 151/255, alpha: 1.0)
    static let orangeColor = UIColor(red: 249/255, green: 101/255, blue: 81/255, alpha: 1.0)
    static let backColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1.0)
    static let grayColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
}

struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS =  UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
}

