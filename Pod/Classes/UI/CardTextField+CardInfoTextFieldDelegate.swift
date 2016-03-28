//
//  CardTextField+UITextFieldDelegate.swift
//  Caishen
//
//  Created by Daniel Vancura on 3/4/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

extension CardTextField: CardInfoTextFieldDelegate {

    public func textField(textField: UITextField, didEnterValidInfo: String) {
        updateNumberColor()
        notifyDelegate()
        selectNextTextField(textField)
    }
    
    public func textField(textField: UITextField, didEnterPartiallyValidInfo: String) {
        updateNumberColor()
        notifyDelegate()
    }
    
    private func selectNextTextField(textField: UITextField) {
        if textField == monthTextField {
            yearTextField?.becomeFirstResponder()
        } else if textField == yearTextField {
            cvcTextField?.becomeFirstResponder()
        }
    }
    
    private func updateNumberColor() {
        // if the date is Expiry.invalid, it means that no real date is calculated yet
        // if the calculated real date is in the past, set the text color for the date to `invalidNumberColor`
        if card.expiryDate.rawValue.timeIntervalSinceNow < 0 && card.expiryDate != Expiry.invalid {
            monthTextField?.textColor = invalidInputColor ?? UIColor.redColor()
            yearTextField?.textColor = invalidInputColor ?? UIColor.redColor()
        } else {
            monthTextField?.textColor = numberInputTextField?.textColor ?? UIColor.blackColor()
            yearTextField?.textColor = numberInputTextField?.textColor ?? UIColor.blackColor()
        }
    }
}
