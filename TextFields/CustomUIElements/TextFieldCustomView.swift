//
//  TextFieldCustomView.swift
//  TextFields
//
//  Created by Roman Ivanov on 03.06.2022.
//

import UIKit

class TextFieldCustomView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var limitLabel: UILabel!
    @IBOutlet weak var minDigitsLabel: UILabel!
    @IBOutlet weak var minLowercaseLabel: UILabel!
    @IBOutlet weak var minUppercaseLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var minLengthLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        let viewFromXib = Bundle.main.loadNibNamed("TextFieldCustomView", owner: self, options: nil)!.first as! UIView
        viewFromXib.translatesAutoresizingMaskIntoConstraints = false
        viewFromXib.frame = self.frame
        addSubview(viewFromXib)
        viewFromXib.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        viewFromXib.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        viewFromXib.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        viewFromXib.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
