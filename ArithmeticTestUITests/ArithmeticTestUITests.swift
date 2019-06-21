//
//  ArithmeticTestUITests.swift
//  ArithmeticTestUITests
//
//  Created by Yuni on 2019/3/5.
//  Copyright © 2019 Yuni. All rights reserved.
//

import XCTest
@testable import ArithmeticTest

class ArithmeticTestUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testProj() {
        let app = XCUIApplication()
        
        // check the labels if it exists or not in MainVC.
        XCTAssert(app.staticTexts["addLabel"].exists)
        XCTAssertEqual(app.staticTexts["notExistLabel"].exists, false)
        // check the label if it exists or not in NextVC.
        XCTAssertEqual(app.staticTexts["nextVC_label"].exists, false)
        
        // check the button if it exists or not.
        let buttonIsExists = app.buttons["nextBtn"].exists
        XCTAssert(buttonIsExists)
        // check the buttom if it is hittlable or not.
        let buttonIsHittable = app.buttons["nextBtn"].isHittable
        XCTAssert(buttonIsHittable)
        
        // click button, go to NextVC
        app.buttons["nextBtn"].tap()
        // check the label if it exists or not in NextVC.
        XCTAssert(app.staticTexts["nextVC_label"].exists)
        // back to MainVC
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        // check the labels if it exists or not in MainVC again.
        XCTAssert(app.staticTexts["addLabel"].exists)
        XCTAssertEqual(app.staticTexts["notExistLabel"].exists, false)
        // check the label if it exists or not in NextVC again.
        XCTAssertEqual(app.staticTexts["nextVC_label"].exists, false)
    }
}
