//
//  InputLimitViewController.swift
//  TextFields
//
//  Created by Roman Ivanov on 04.06.2022.
//

import UIKit

class InputLimitViewController: UIViewController {

    @IBOutlet weak var inputLimitView: TextFieldCustomView!
    var limit = 10
    var stringCount = 0
    private lazy var inputeLimitDelegateObject = InputLimitRuleDelegat(
        label: inputLimitView.limitLabel,
        limit: limit,
        stringCount: stringCount
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputLimitView.limitLabel.isHidden = false
        inputLimitView.titleLabel.text = "Input limit"
        inputLimitView.limitLabel.text = getLimitLabelText()
        inputLimitView.inputTextField.addTarget(
            inputeLimitDelegateObject,
            action: #selector(InputLimitRuleDelegat.editingChanged(_:)),
            for: .editingChanged)
    }

    private func getLimitLabelText() -> String {
        return "\(stringCount)/\(limit)"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        view.endEditing(true)
    }

}
