//
//  TextFieldsTests.swift
//  TextFieldsTests
//
//  Created by Roman Ivanov on 13.06.2022.
//

import XCTest
@testable import TextFields

class TextFieldsTests: XCTestCase {

    var sut: TextFieldModel!

    override func setUp() {
        sut = TextFieldModel()
    }

    override func tearDown() {
        sut = nil
    }

    func test_textField_allCharacterBesidesDigits() {
        XCTAssertFalse(sut.contains(string: "abc", regex: "[0-9]"))
    }

    func test_textField_minOneLowercase() {
        XCTAssertTrue(sut.contains(string: "HELLO World", regex: ".*[a-z].*"))
    }

    func test_textField_minOneUppercase() {
        XCTAssertTrue(sut.contains(string: "hello World", regex: ".*[A-Z].*"))
    }

    func test_textField_min8Characters() {
        XCTAssertTrue(sut.contains(string: "password", regex: ".{8,}"))
    }

    func test_linkInput_trigger() {
        let exp = expectation(description: #function)
        let sutDelegate = LinkRuleDelegate { url in
            exp.fulfill()
        }
        let sutTextField = UITextField()
        sutTextField.addTarget(
            sutDelegate,
            action: #selector(LinkRuleDelegate.editingChanged(_:)),
            for: .editingChanged
        )

        sutTextField.text = "http://google.com"
        sutTextField.sendActions(for: .editingChanged)

        wait(for: [exp], timeout: 4)
    }

}
