//
//  NoDigitsViewController.swift
//  TextFields
//
//  Created by Roman Ivanov on 04.06.2022.
//

import UIKit

class NoDigitsViewController: UIViewController {

    @IBOutlet weak var noDigitsView: TextFieldCustomView!
    let model = TextFieldModel()
    let regex = "[0-9]"
    private lazy var noDigitsDelegateObject = InputRuleTextFieldDelegate(rule: NoDigitsRule(model: model, regex: regex))

    override func viewDidLoad() {
        super.viewDidLoad()

        noDigitsView.titleLabel.text = "NO digits field"
        noDigitsView.inputTextField.delegate = noDigitsDelegateObject
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        view.endEditing(true)
    }

}
