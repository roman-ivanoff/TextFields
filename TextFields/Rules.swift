//
//  Rules.swift
//  TextFields
//
//  Created by Roman Ivanov on 04.06.2022.
//

import Foundation
import UIKit
import SafariServices

struct NoDigitsRule: InputRuleProtocol {
    let model: TextFieldModel
    let regex: String

    func inputRule(string: String) -> Bool {
        if model.checkBackspace(string: string) {
            return true
        }

        return !model.contains(string: string, regex: regex)
    }

}

struct OnlyCharactersRule: InputRuleProtocol {
    let model: TextFieldModel
    var letterCount: Int
    var digitCount: Int
    var delimiter: String
    let lettersRegex: String
    let digitsRegex: String
    var textField: UITextField

    func inputRule(string: String) -> Bool {
        if model.checkBackspace(string: string) {
            return true
        }

        if textField.text!.count < letterCount {
            if model.contains(string: string, regex: lettersRegex) {
                if (textField.text! + string).count == letterCount {
                    textField.text! += string + delimiter
                    return false
                }
                return true
            }
        } else if textField.text!.count < letterCount + digitCount + delimiter.count {
            return model.contains(string: string, regex: digitsRegex)
        }

        return false
    }

}

struct PasswordTextFieldRule: InputRuleProtocol {
    let model: TextFieldModel
    var textField: UITextField
    var minLengthLabel: UILabel
    var minDigitsLabel: UILabel
    var minLowercaseLabel: UILabel
    var minUppercaseLabel: UILabel
    var min8CharactersRegex: String
    var minOneDigitRegex: String
    var minOneLowercaseRegex: String
    var minOneUppercaseRegex: String
    var validatedColor: UIColor
    var defaultTextColor: UIColor

    func inputRule(string: String) -> Bool {
        let stringWithoutBackspace =  model.checkBackspace(string: string) ?
            String(textField.text!.dropLast()) :
            textField.text! + string

        if model.contains(string: stringWithoutBackspace, regex: min8CharactersRegex) {
            minLengthLabel.textColor = validatedColor
            minLengthLabel.accessibilityLabel = "green"
        } else {
            minLengthLabel.textColor = defaultTextColor
            minLengthLabel.accessibilityLabel = "default"
        }

        if model.contains(string: stringWithoutBackspace, regex: minOneDigitRegex) {
            minDigitsLabel.textColor = UIColor.green
            minDigitsLabel.accessibilityLabel = "green"
        } else {
            minDigitsLabel.textColor = defaultTextColor
            minDigitsLabel.accessibilityLabel = "default"
        }

        if model.contains(string: stringWithoutBackspace, regex: minOneLowercaseRegex) {
            minLowercaseLabel.textColor = validatedColor
            minLowercaseLabel.accessibilityLabel = "green"
        } else {
            minLowercaseLabel.textColor = defaultTextColor
            minLowercaseLabel.accessibilityLabel = "default"
        }

        if model.contains(string: stringWithoutBackspace, regex: minOneUppercaseRegex) {
            minUppercaseLabel.textColor = validatedColor
            minUppercaseLabel.accessibilityLabel = "green"
        } else {
            minUppercaseLabel.textColor = defaultTextColor
            minUppercaseLabel.accessibilityLabel = "default"
        }

        return true
    }

}
