//
//  AccountUITestingUITestsLaunchTests.swift
//  AccountUITestingUITests
//
//  Created by 新垣 清奈 on 2022/08/30.
//

import XCTest

class AccountUITestingUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let userNameTextField = app.textFields["username"]
        XCTAssertTrue(userNameTextField.exists)
        userNameTextField.tap()
        userNameTextField.typeText("UserName")

        let passwordTextField = app.textFields["password"]
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText("Password")

        let logInButton = app.buttons["Log In"]
        XCTAssertTrue(logInButton.exists)
        logInButton.tap()

        let succeededLabel = app.staticTexts["Successfully Log In!"]
        XCTAssertTrue(succeededLabel.exists)

    }
}
