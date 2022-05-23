//
//  FavoriteLocalDataSourceSpec.swift
//  FakefyData
//
//  Created by Ney Moura on 19/10/21.
//

@testable import FakefyData
@testable import FakefyDomain

import Nimble
import Quick
import CoreData

class FavoriteLocalDataSourceSpec: QuickSpec {
    override func spec() {
        describe("favorite local data source") {
            context("saving album") {
                it("with all fields") {
                    self.savingAlbumWithAllFields()
                }
                it("with missing mandatory fields") {
                    self.savingAlbumWithMissingMandatoryFields()
                }
            }
            context("saving and fetching album") {
                it("with same object") {
                    self.savingAndFetchingAlbumWithSameObject()
                }
            }
        }
    }
}

// MARK: - Implementaiton
extension FavoriteLocalDataSourceSpec {
    
    // MARK: - Writing
    func savingAlbumWithAllFields() {
        // GIVEN
        let container = TestCoreDataStack.init().container
        let context = container.newBackgroundContext()
        var hadError = false
        
        let albumData: Data = Mock().dataFromJson(named: "search-success")
        let album: Album = try! JSONDecoder().decode([Album].self, from: albumData, atKeyPath: "results")[.zero]
        
        let newItem = AlbumMO(context: context)

        Mirror(reflecting: album).copyAttributes(into: newItem)
        
        // WHEN
        do {
            try context.save()
            hadError = false
        } catch {
            
            hadError = true
        }
        
        // THEN
        expect(hadError).to(beFalse())
    }
    
    func savingAlbumWithMissingMandatoryFields() {
        // GIVEN
        let container = TestCoreDataStack.init().container
        let context = container.newBackgroundContext()
        var hadError: Bool = false
        _ = AlbumMO(context: context)

        // WHEN
        do {
            try context.save()
            hadError = false
        } catch {
            hadError = true
        }
        
        // THEN
        expect(hadError).to(beTrue())
    }
    
    // MARK: - Saving and fetching
    func savingAndFetchingAlbumWithSameObject() {
        // GIVEN
        let container = TestCoreDataStack.init().container
        let context = container.newBackgroundContext()
        let fetchRequest = AlbumMO.fetchRequest()
        var hadError = false
        var result: [AlbumMO] = []
        
        let albumData: Data = Mock().dataFromJson(named: "search-success")
        let album: Album = try! JSONDecoder().decode([Album].self, from: albumData, atKeyPath: "results")[.zero]
        
        let newItem = AlbumMO(context: context)

        Mirror(reflecting: album).copyAttributes(into: newItem)
                
        // WHEN
        do {
            try context.save()
            result = try context.fetch(fetchRequest)
            hadError = false
        } catch {
            hadError = true
        }
        
        // THEN
        expect(hadError).to(beFalse())
        expect(result).notTo(beNil())
        expect(result).notTo(beEmpty())
        expect(result.count).to(equal(1))
        expect(result.first).notTo(beNil())
        
        let firstResult = result.first!
        expect(firstResult).notTo(beNil())
        expect(firstResult.wrapperType).to(equal("collection"))
        expect(firstResult.artistId).to(equal(3296287))
        expect(firstResult.collectionId).to(equal(1440650428))
        expect(firstResult.artistName).to(equal("Queen"))
        expect(firstResult.collectionName).to(equal("The Platinum Collection (Greatest Hits I, II & III)"))
        expect(firstResult.collectionCensoredName).to(equal("The Platinum Collection (Greatest Hits I, II & III)"))
        expect(firstResult.artistViewUrl).to(equal("https://music.apple.com/us/artist/queen/3296287?uo=4"))
        expect(firstResult.collectionViewUrl).to(equal("https://music.apple.com/us/album/the-platinum-collection-greatest-hits-i-ii-iii/1440650428?uo=4"))
        expect(firstResult.artworkUrl60).to(equal("https://is3-ssl.mzstatic.com/image/thumb/Music115/v4/83/23/e4/8323e48b-3467-448b-1ce0-8981d8a97437/source/60x60bb.jpg"))
        expect(firstResult.artworkUrl100).to(equal("https://is3-ssl.mzstatic.com/image/thumb/Music115/v4/83/23/e4/8323e48b-3467-448b-1ce0-8981d8a97437/source/100x100bb.jpg"))
        expect(firstResult.collectionPrice).to(equal(24.99))
        expect(firstResult.collectionExplicitness).to(equal("notExplicit"))
        expect(firstResult.trackCount).to(equal(51))
        expect(firstResult.copyright).to(equal("℗ 2014 Hollywood Records, Inc."))
        expect(firstResult.releaseDate).to(equal("2014-01-01T08:00:00Z"))
        expect(firstResult.country).to(equal("USA"))
        expect(firstResult.currency).to(equal("USD"))
        expect(firstResult.primaryGenreName).to(equal("Rock"))
    }
}
