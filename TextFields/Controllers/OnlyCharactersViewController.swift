//
//  OnlyCharactersViewController.swift
//  TextFields
//
//  Created by Roman Ivanov on 04.06.2022.
//

import UIKit

class OnlyCharactersViewController: UIViewController {

    @IBOutlet weak var onlyCharactersView: TextFieldCustomView!
    var letterCount = 5
    var digitCount = 5
    var delimiter = "-"
    let lettersRegex = "[A-Za-z]"
    let digitsRegex = "[0-9]"
    let model = TextFieldModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        onlyCharactersView.titleLabel.text = "Only characters"
        onlyCharactersView.inputTextField.attributedPlaceholder = NSAttributedString("wwwww-ddddd")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        view.endEditing(true)
    }

}
