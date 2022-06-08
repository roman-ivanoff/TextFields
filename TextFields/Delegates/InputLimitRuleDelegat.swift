//
//  InputLimitRuleDelegat.swift
//  TextFields
//
//  Created by Roman Ivanov on 08.06.2022.
//

import UIKit

class InputLimitRuleDelegat: NSObject {
    var label: UILabel
    var limit: Int
    var stringCount: Int

    init(label: UILabel, limit: Int, stringCount: Int) {
        self.label = label
        self.limit = limit
        self.stringCount = stringCount
        super.init()
    }

    @objc func editingChanged(_ sender: UITextField) {
        setLimits(sender)
    }

    private func setLimits(_ textField: UITextField) {
        stringCount = textField.text!.count
        if (textField.text!.count) > (limit) {
            changeTextFieldBorderColor(textField, color: UIColor.red)
            textField.layer.borderWidth = 1.0
            textField.layer.cornerRadius = 5
            changeLabelColor()
            changeTextFieldTextColor(textField)
        } else {
            label.textColor = .black
            changeTextFieldBorderColor(textField, color: UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0))
        }

        label.text = getLimitLabelText()
    }

    private func changeLabelColor() {
        let attributedText = NSMutableAttributedString(attributedString: label.attributedText!)
        attributedText.setAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], range: NSRange(location: 0, length: attributedText.length))
        label.attributedText = attributedText
    }

    private func changeTextFieldTextColor(_ textField: UITextField) {
        let attributedText = NSMutableAttributedString(attributedString: textField.attributedText!)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location: limit, length: attributedText.length - limit))
        textField.attributedText = attributedText
    }

    private func changeTextFieldBorderColor(_ textField: UITextField, color: UIColor) {
        textField.layer.borderColor = color.cgColor
    }

    private func getLimitLabelText() -> String {
        return "\(stringCount)/\(limit)"
    }

}

