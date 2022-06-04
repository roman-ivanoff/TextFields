//
//  LinkViewController.swift
//  TextFields
//
//  Created by Roman Ivanov on 04.06.2022.
//

import UIKit
import SafariServices

class LinkViewController: UIViewController {

    @IBOutlet weak var linkView: TextFieldCustomView!
    var workItem: DispatchWorkItem?
    let model = TextFieldModel()
    var safariVC: SFSafariViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        linkView.titleLabel.text = "Link"
        linkView.inputTextField.attributedPlaceholder = NSAttributedString("www.example.com")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        view.endEditing(true)
    }

    func followLink(url: URL) {
        safariVC = SFSafariViewController(url: url)
//        safariVC!.delegate = linkDelegateObject
        self.present(safariVC!, animated: true, completion: nil)
    }
}
