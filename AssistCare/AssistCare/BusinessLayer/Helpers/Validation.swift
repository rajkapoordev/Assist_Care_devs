//
//  Validation.swift
//  AssistCare
//
//  Created by LaNet on 1/21/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import Foundation

// Validation
func isValidEmail(strEmail : String) ->  Bool
{
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: strEmail)
}

func isValidPassword(strPassword : String) -> Bool
{
    let totalChar = strPassword.characters.count
    return totalChar < 8
}

func isValidText(strText : String) ->  Bool
{
    let textRegEx = "[A-Za-z -]+"
    let textTest = NSPredicate(format:"SELF MATCHES %@", textRegEx)
    return textTest.evaluate(with: strText)
}

