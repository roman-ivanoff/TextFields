//
//  PasswordViewController.swift
//  TextFields
//
//  Created by Roman Ivanov on 04.06.2022.
//

import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet weak var passwordView: TextFieldCustomView!
    let model = TextFieldModel()
    let min8CharactersRegex = ".{8,}"
    let minOneDigitRegex = ".*[0-9].*"
    let minOneLowercaseRegex = ".*[a-z].*"
    let minOneUppercaseRegex = ".*[A-Z].*"
    let defaultTextColor = #colorLiteral(red: 0.4159630239, green: 0.4159630239, blue: 0.4159630239, alpha: 1)
    let validatedColor = UIColor.green
    private lazy var passwordDelegateObject = PasswordTextFieldDelegate(rule: PasswordTextFieldRule(
        model: model,
        textField: passwordView.inputTextField,
        minLengthLabel: passwordView.minLengthLabel,
        minDigitsLabel: passwordView.minDigitsLabel,
        minLowercaseLabel: passwordView.minLowercaseLabel,
        minUppercaseLabel: passwordView.minUppercaseLabel,
        min8CharactersRegex: min8CharactersRegex,
        minOneDigitRegex: minOneDigitRegex,
        minOneLowercaseRegex: minOneLowercaseRegex,
        minOneUppercaseRegex: minOneUppercaseRegex,
        validatedColor: validatedColor,
        defaultTextColor: defaultTextColor)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLabelVisibility(state: false)
        passwordView.titleLabel.text = "Validation rules"
        passwordView.inputTextField.isSecureTextEntry = true
        passwordView.inputTextField.attributedPlaceholder = NSAttributedString("password")
        passwordView.inputTextField.delegate = passwordDelegateObject
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        view.endEditing(true)
    }

    private func setLabelVisibility(state: Bool) {
        passwordView.minLengthLabel.isHidden = state
        passwordView.minDigitsLabel.isHidden = state
        passwordView.minLowercaseLabel.isHidden = state
        passwordView.minUppercaseLabel.isHidden = state
    }

}
