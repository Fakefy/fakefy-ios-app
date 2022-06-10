//
//  SearchViewControllerUITests.swift
//  AppUITests
//
//  Created by Ney Pequeno (Contractor) on 10/06/22.
//

import Quick
import Nimble
import XCTest


class SearchViewControllerUITests: QuickSpec {
    
    var app: XCUIApplication!
    
    override func spec() {
        describe("SearchViewControllerUITests") {
            beforeEach {
                self.app = XCUIApplication()
                self.app.launch()
            }
            it("should be presented on launch") {
                expect(self.app.otherElements["searchViewController"].exists).to(beTrue())
            }
        }
    }
}
