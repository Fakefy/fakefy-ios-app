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
            
            afterEach {
                self.app = nil
            }
            
            context("launching the app") {
                it("should present search screen") {
                    self.shouldPresentSearchScreen()
                }
            }
            
            context("initial state") {
                it("should present the search bar with no results") {
                    self.shouldDisplaySearchBarWithNoResults()
                }
            }
            
            context("searching") {
                it("should display results") {
                    self.shouldDisplayResults()
                }
                it("should show empty state") {
                    self.shouldDisplayEmptyState()
                }
            }
        }
    }
}

extension SearchViewControllerUITests {
    func shouldPresentSearchScreen() {
        expect(self.app.otherElements["searchViewController"].exists).to(beTrue())
    }
    
    func shouldDisplaySearchBarWithNoResults() {
        // Given
        let searchBar = self.app.searchFields["searchView"]
        let tableView = self.app.tables["tableView"]
        
        // Then
        expect(searchBar.exists).to(beTrue())
        expect(tableView.exists).to(beTrue())
        expect(tableView.tableRows.count).to(equal(0))
    }
    
    func shouldDisplayResults() {
        // Given
        let searchBar = self.app.searchFields["searchView"]
        let tableView = self.app.tables["tableView"]
        
        // When
        searchBar.tap()
        searchBar.typeText("Queen")
        sleep(3) // TODO: Removing when mocking results
        
        // Then
        expect(searchBar.exists).to(beTrue())
        expect(tableView.exists).to(beTrue())
        expect(tableView.cells.count).toNot(equal(0))
    }
    
    func shouldDisplayEmptyState() {
        // Given
        let searchBar = self.app.searchFields["searchView"]
        let tableView = self.app.tables["tableView"]
        
        // When
        searchBar.tap()
        searchBar.typeText("~")
        sleep(3) // TODO: Removing when mocking results
        
        // Then
        expect(searchBar.exists).to(beTrue())
        expect(tableView.exists).to(beTrue())
        expect(tableView.tableRows.count).to(equal(0))
    }
}
