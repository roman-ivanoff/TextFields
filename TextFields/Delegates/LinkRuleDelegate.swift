//
//  LinkRuleDelegate.swift
//  TextFields
//
//  Created by Roman Ivanov on 08.06.2022.
//

import UIKit
import SafariServices

class LinkRuleDelegate: NSObject {
    private let onLinkDetected: (URL) -> Void
    private let dataDetector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)


    init(onLinkDetected: @escaping (URL) -> Void) {
        self.onLinkDetected = onLinkDetected
        super.init()
    }

    @objc func editingChanged(_ sender: UITextField) {
        let workItem = DispatchWorkItem { [self] in
            guard let text = sender.text,
                  let match = dataDetector.firstMatch(
                    in: text,
                    options: [],
                    range: NSRange(location: 0, length: text.utf16.count)
                  ),
                  let range = Range(match.range, in: text),
                  let url = URL(string: String(text[range])) else {
                return
            }
            self.onLinkDetected(url)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: workItem)
    }
}

extension LinkRuleDelegate: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

