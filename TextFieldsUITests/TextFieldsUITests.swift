//
//  TextFieldsUITests.swift
//  TextFieldsUITests
//
//  Created by Roman Ivanov on 18.06.2022.
//

import XCTest

class TextFieldsUITests: XCTestCase {

    var app: XCUIApplication!
    let textFieldId = "inputTextField"

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testUIViewsExist() {
        app.tabBars.firstMatch.buttons.element(boundBy: 0).tap()
        XCTAssertTrue(app.staticTexts["titleLabel"].exists)
        XCTAssertTrue(app.textFields[textFieldId].exists)

        app.tabBars.firstMatch.buttons.element(boundBy: 1).tap()
        XCTAssertTrue(app.staticTexts["titleLabel"].exists)
        XCTAssertTrue(app.textFields[textFieldId].exists)
        XCTAssertTrue(app.staticTexts["countLabel"].exists)

        app.tabBars.firstMatch.buttons.element(boundBy: 2).tap()
        XCTAssertTrue(app.staticTexts["titleLabel"].exists)
        XCTAssertTrue(app.textFields[textFieldId].exists)

        app.tabBars.firstMatch.buttons.element(boundBy: 3).tap()
        XCTAssertTrue(app.staticTexts["titleLabel"].exists)
        XCTAssertTrue(app.textFields[textFieldId].exists)

        app.tabBars.firstMatch.buttons.element(boundBy: 4).tap()
        XCTAssertTrue(app.staticTexts["titleLabel"].exists)
        XCTAssertTrue(app.secureTextFields[textFieldId].exists)
        XCTAssertTrue(app.staticTexts["minLengthLabell"].exists)
        XCTAssertTrue(app.staticTexts["min1DigitLabel"].exists)
        XCTAssertTrue(app.staticTexts["min1LowercaseLabel"].exists)
        XCTAssertTrue(app.staticTexts["min1UppercaseLabel"].exists)
    }

    func test_noDigits_printLetters() {
        app.tabBars.firstMatch.buttons.element(boundBy: 0).tap()
        let phrase = "hello world..."
        enterStringInTextFieldById(phrase: phrase, id: textFieldId)
        // Check result
        XCTAssertEqual(app.textFields[textFieldId].value as! String, phrase)
    }

    func test_noDigits_printLettersAndDigits() {
        app.tabBars.firstMatch.buttons.element(boundBy: 0).tap()
        let phrase = "h12ell1o wo22rld..."
        let expextedResult = "hello world..."
        enterStringInTextFieldById(phrase: phrase, id: textFieldId)
        // Check result
        XCTAssertEqual(app.textFields[textFieldId].value as! String, expextedResult)
    }

    func test_inputLimit() {
        app.tabBars.firstMatch.buttons.element(boundBy: 1).tap()
        var phrase = "hello worl"
        var expextedResult = "10/10"
        enterStringInTextFieldById(phrase: phrase, id: textFieldId)

        XCTAssertEqual(expextedResult, app.staticTexts.element(matching: .any, identifier: "countLabel").label)

        clearTextField(id: textFieldId)
        phrase = "hello world"
        expextedResult = "11/10"
        enterStringInTextFieldById(phrase: phrase, id: textFieldId)
        XCTAssertEqual(expextedResult, app.staticTexts.element(matching: .any, identifier: "countLabel").label)
    }

    func test_onlyCharacters() {
        app.tabBars.firstMatch.buttons.element(boundBy: 2).tap()
        let phrase = "wwwww11111"
        let expextedResult = "wwwww-11111"
        enterStringInTextFieldById(phrase: phrase, id: textFieldId)
        // Check result
        XCTAssertEqual(app.textFields[textFieldId].value as! String, expextedResult)
    }

    func test_onlyCharacters_printCharactersIncorrectPrint() {
        app.tabBars.firstMatch.buttons.element(boundBy: 2).tap()
        let phrase = "-ww11www111w1w1"
        let expextedResult = "wwwww-11111"
        enterStringInTextFieldById(phrase: phrase, id: textFieldId)
        // Check result
        XCTAssertEqual(app.textFields[textFieldId].value as! String, expextedResult)
    }

    func test_password() {
        app.tabBars.firstMatch.buttons.element(boundBy: 4).tap()
        var password = "p"
        enterStringInSecureTextFieldById(phrase: password, id: textFieldId)
        XCTAssertEqual(app.staticTexts["min1LowercaseLabel"].label, "green")

        password = "pA"
        enterStringInSecureTextFieldById(phrase: password, id: textFieldId)
        XCTAssertEqual(app.staticTexts["min1UppercaseLabel"].label, "green")

        password = "pA1"
        enterStringInSecureTextFieldById(phrase: password, id: textFieldId)
        XCTAssertEqual(app.staticTexts["min1DigitLabel"].label, "green")

        password = "pA1ssword"
        enterStringInSecureTextFieldById(phrase: password, id: textFieldId)
        XCTAssertEqual(app.staticTexts["minLengthLabell"].label, "green")
    }

    // Group repeating parts
    private func enterStringInTextFieldById(phrase: String, id: String) {
        // String input
        let textField = app.textFields[id]
        textField.tap()
        textField.typeText(phrase)

        // Hide keyboard
        app.staticTexts["titleLabel"].tap()
    }

    private func enterStringInSecureTextFieldById(phrase: String, id: String) {
        // String input
        let textField = app.secureTextFields[id]
        textField.tap()
        textField.typeText(phrase)

        // Hide keyboard
        app.staticTexts["titleLabel"].tap()
    }

    private func clearTextField(id: String) {
        app.textFields[id].press(forDuration: 1.5)
        app.menuItems["Select All"].tap()
        app.menuItems["Cut"].tap()
    }

}
