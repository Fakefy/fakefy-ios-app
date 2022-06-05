//
//  SearchUseCaseSpec.swift
//  Fakefy Domain
//
//  Created by Ney Moura on 10/06/21.
//

import Foundation
import Nimble
import Quick

@testable import FakefyDomain

class SearchUseCaseSpec: QuickSpec {
    override func spec() {
        describe("search use case") {
            context("searching album") {
                it("and returning success") {
                    self.searchAlbumReturningSuccess()
                }
                it("and returning failure") {
                    self.searchAlbumReturningFailure()
                }
            }
        }
    }
}

// MARK: - Test Implementation
extension SearchUseCaseSpec {

    func searchAlbumReturningSuccess() {

        // Given
        class RepositoryMock: SearchRepository {
            func search<T>(request: SearchRequest, returning: T.Type, callback: @escaping (Result<[T], ITunesError>) -> Void) where T : Codable {
                let data = Mock().dataFromJson(named: "search-success")
                let searchResult = try! JSONDecoder().decode([T].self, from: data, atKeyPath: "results")
                callback(Result.success(searchResult))
            }
        }
        
        let useCase = UseCaseFactory.makeSearchUseCase(searchRepository: RepositoryMock())
        let expectation = expectation(description: "business-expectation")
        var result: Result<[Album], ITunesError>?

        // When
        useCase.searchAlbum(with: "", country: "") {
            result = $0
            expectation.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)

        expect(result).to(beSuccess { searchResult in
            expect(searchResult).notTo(beEmpty())
        })
    }

    func searchAlbumReturningFailure() {

        // Given
        class RepositoryMock: SearchRepository {
            func search<T>(request: SearchRequest, returning: T.Type, callback: @escaping (Result<[T], ITunesError>) -> Void) where T : Codable {
                let error = ITunesError(type: .generic)
                callback(Result.failure(error))
            }
        }
        
        let useCase = UseCaseFactory.makeSearchUseCase(searchRepository: RepositoryMock())
        let expectation = expectation(description: "business-expectation")
        var result: Result<[Album], ITunesError>?

        // When
        useCase.searchAlbum(with: "", country: "") {
            result = $0
            expectation.fulfill()
        }

        // Then
        expect(result).to(beFailure { error in
            expect(error.type).to(equal(.generic))
        })
    }
}
