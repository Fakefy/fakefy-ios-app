//
//  SearchRemoteDataSourceSpec.swift
//  FakefyData
//
//  Created by Ney Moura on 10/06/21.
//

import Nimble
import Quick
import Moya

@testable import FakefyData
@testable import FakefyDomain

class SearchRemoteDataSourceSpec: QuickSpec {
    override func spec() {
        describe("search remote data source") {
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
extension SearchRemoteDataSourceSpec {
    
    func searchAlbumReturningSuccess() {
        
        // Given
        let mockData = Mock().dataFromJson(named: "search-success")
        let mock = Mock().mock(api: ApiReference.Search.search, status: 200, data: mockData)
        let remote = DataSourceFactory.makeSearchRemoteDataSource(endpointClosure: mock, stubClosure: MoyaProvider<SearchAPI>.immediatelyStub)
        let searchRequest = SearchRequest(term: "", country: "", media: "", entity: "", attribute: "")
        let expectation = expectation(description: "network-expectation")
        var result: Result<[Album], ITunesError>?
        
        // When
        remote.search(request: searchRequest, returning: Album.self) {
            result = $0
            expectation.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5)
        
        expect(result).to(beSuccess { searchResults in
            expect(searchResults.count).to(equal(1))
            let firstResult = searchResults.first
            expect(firstResult).notTo(beNil())
            expect(firstResult!.wrapperType).to(equal("collection"))
            expect(firstResult!.artistId).to(equal(3296287))
            expect(firstResult!.collectionId).to(equal(1440650428))
            expect(firstResult!.artistName).to(equal("Queen"))
            expect(firstResult!.collectionName).to(equal("The Platinum Collection (Greatest Hits I, II & III)"))
            expect(firstResult!.collectionCensoredName).to(equal("The Platinum Collection (Greatest Hits I, II & III)"))
            expect(firstResult!.artistViewUrl).to(equal("https://music.apple.com/us/artist/queen/3296287?uo=4"))
            expect(firstResult!.collectionViewUrl).to(equal("https://music.apple.com/us/album/the-platinum-collection-greatest-hits-i-ii-iii/1440650428?uo=4"))
            expect(firstResult!.artworkUrl60).to(equal("https://is3-ssl.mzstatic.com/image/thumb/Music115/v4/83/23/e4/8323e48b-3467-448b-1ce0-8981d8a97437/source/60x60bb.jpg"))
            expect(firstResult!.artworkUrl100).to(equal("https://is3-ssl.mzstatic.com/image/thumb/Music115/v4/83/23/e4/8323e48b-3467-448b-1ce0-8981d8a97437/source/100x100bb.jpg"))
            expect(firstResult!.collectionPrice).to(equal(24.99))
            expect(firstResult!.collectionExplicitness).to(equal("notExplicit"))
            expect(firstResult!.trackCount).to(equal(51))
            expect(firstResult!.copyright).to(equal("℗ 2014 Hollywood Records, Inc."))
            expect(firstResult!.releaseDate).to(equal("2014-01-01T08:00:00Z"))
            expect(firstResult!.country).to(equal("USA"))
            expect(firstResult!.currency).to(equal("USD"))
            expect(firstResult!.primaryGenreName).to(equal("Rock"))
        })
    }
    
    func searchAlbumReturningFailure() {
        
        // Given
        let mock = Mock().mock(api: ApiReference.Search.search, status: 401, data: Data())
        let remote = DataSourceFactory.makeSearchRemoteDataSource(endpointClosure: mock, stubClosure: MoyaProvider<SearchAPI>.immediatelyStub)
        let searchRequest = SearchRequest(term: "", country: "", media: "", entity: "", attribute: "")
        let expectation = expectation(description: "network-expectation")
        var result: Result<[Album], ITunesError>?

        // When
        remote.search(request: searchRequest, returning: Album.self) {
            result = $0
            expectation.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5)
        
        expect(result).to(beFailure { error in
            expect(error.type).to(equal(.generic))
        })
    }
}
