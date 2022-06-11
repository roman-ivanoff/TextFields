//
//  PasswordTextFieldDelegate.swift
//  TextFields
//
//  Created by Roman Ivanov on 11.06.2022.
//
import UIKit

class PasswordTextFieldDelegate: NSObject {
    private let inputRule: InputRuleProtocol

    init(rule: InputRuleProtocol) {
        self.inputRule = rule
        super.init()
    }
}

extension PasswordTextFieldDelegate: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        inputRule.inputRule(string: string)
    }
}
