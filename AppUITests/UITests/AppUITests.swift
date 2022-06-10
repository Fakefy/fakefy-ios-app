//
//  AppUITests.swift
//  AppUITests
//
//  Created by Ney Pequeno (Contractor) on 10/06/22.
//

import XCTest

class AppUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        continueAfterFailure = false
    }

    func testExample() throws {
        app.launch()
        XCTAssert(app.otherElements["searchViewController"].exists)
    }
}
