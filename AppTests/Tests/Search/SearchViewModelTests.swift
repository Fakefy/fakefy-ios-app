//
//  AppTests.swift
//  AppTests
//
//  Created by Ney Pequeno (Contractor) on 06/06/22.
//

import Foundation
import Nimble
import Quick
import FakefyDomain
@testable import App

class SearchViewModelSpec: QuickSpec {
    override func spec() {
        describe("search view model") {
            context("searching album") {
                it("with no term") {
                    self.searchWithNoTerm()
                }
                
                it("with term and returning success") {
                    self.searchWithTermReturningSuccess()
                }
                it("with term and returning failure") {
                    self.searchWithTermReturningFailure()
                }
            }
        }
    }
}

// MARK: - Test Implementation
extension SearchViewModelSpec {
    
    func searchWithNoTerm() {
        // Given
        let useCase = SearchAlbumUseCaseMock()
        let delegate = SearchViewModelDelegateMock()
        var viewModel: SearchViewModel = SearchViewModelImpl(useCase: useCase)
        viewModel.delegate = delegate
        
        // When
        viewModel.search(for: "")
        
        // Then
        expect(useCase.didCallSearchAlbum).to(beFalse())
        expect(delegate.didCallOnSearchUpdated).to(beTrue())
        expect(viewModel.searchResults).to(beEmpty())
    }

    func searchWithTermReturningSuccess() {
        // Given
        let useCase = SearchAlbumUseCaseMock()
        useCase.searchAlbumCallback = .success([])
        let delegate = SearchViewModelDelegateMock()
        var viewModel: SearchViewModel = SearchViewModelImpl(useCase: useCase)
        viewModel.delegate = delegate
        
        // When
        viewModel.search(for: "Queen")
        
        // Then
        expect(useCase.didCallSearchAlbum).toEventually(beTrue(), timeout: .seconds(5))
        expect(delegate.didCallOnSearchUpdated).to(beTrue())
        expect(viewModel.searchResults).to(beEmpty())
    }

    func searchWithTermReturningFailure() {
        // Given
        let useCase = SearchAlbumUseCaseMock()
        useCase.searchAlbumCallback = .failure(.init(type: .generic))
        let delegate = SearchViewModelDelegateMock()
        var viewModel: SearchViewModel = SearchViewModelImpl(useCase: useCase)
        viewModel.delegate = delegate
        
        // When
        viewModel.search(for: "Error")
        
        // Then
        expect(useCase.didCallSearchAlbum).toEventually(beTrue(), timeout: .seconds(5))
        expect(delegate.didCallOnSearchUpdated).to(beTrue())
        expect(viewModel.searchResults).to(beEmpty())
    }
}

// MARK: - UseCaseMock

class SearchAlbumUseCaseMock: SearchAlbumUseCase {

    var didCallSearchAlbum: Bool = false
    var searchAlbumCallback: Result<[Album], ITunesError> = .success([])
    
    func searchAlbum(with term: String, country: String, callback: @escaping (Result<[Album], ITunesError>) -> Void) {
        didCallSearchAlbum = true
        callback(searchAlbumCallback)
    }
}

// MARK: - Delegate

class SearchViewModelDelegateMock: SearchViewModelDelegate {
    
    var didCallOnSearchUpdated: Bool = false
    
    func onSearchUpdated() {
        didCallOnSearchUpdated = true
    }
}
