//
//  FavoriteLocalDataSource.swift
//  FakefyData
//
//  Created by Ney Moura on 01/11/21.
//

import CoreData
import FakefyDomain

class FavoriteLocalDataSourceImpl {
    
    let container: NSPersistentContainer
    
    init(container: NSPersistentContainer) {
        self.container = container
    }
}

extension FavoriteLocalDataSourceImpl: FavoriteLocalDataSource {
    func saveAlbum(album: Album, completion: (Result<Void, ITunesError>) -> Void) {
        do {
            let context = container.newBackgroundContext()
            let albumMO = AlbumMO.init(context: context)
            Mirror(reflecting: album).copyAttributes(into: albumMO)
            
            try context.save()
            completion(.success(Void()))
        } catch {
            completion(.failure(ITunesError(type: .generic)))
        }
    }
    
    func fetchAlbums(completion: (Result<[Album], ITunesError>) -> Void) {
        do {
            let context = container.newBackgroundContext()
            let fetchRequest = AlbumMO.fetchRequest()
            let results = try context.fetch(fetchRequest)
            let albumResults = results.map { Album(from: $0) }
            completion(.success(albumResults))
        } catch {
            completion(.failure(ITunesError(type: .generic)))
        }
    }
}

extension Album {
    init(from managed: AlbumMO) {
        let wrapperType = managed.wrapperType ?? "Unkown"
        let artistId = Int(managed.artistId)
        let collectionId = Int(managed.collectionId)
        let artistName = managed.artistName ?? "Unkown"
        let collectionName = managed.collectionName ?? "Unkown"
        let collectionCensoredName = managed.collectionCensoredName ?? "Unkown"
        let artistViewUrl = managed.artistViewUrl ?? "Unkown"
        let collectionViewUrl = managed.collectionViewUrl ?? "Unkown"
        let artworkUrl60 = managed.artworkUrl60
        let artworkUrl100 = managed.artworkUrl100
        let collectionPrice = managed.collectionPrice
        let collectionExplicitness = managed.collectionExplicitness ?? "Unkown"
        let trackCount = Int(managed.trackCount)
        let copyright = managed.copyright
        let releaseDate = managed.releaseDate
        let country = managed.country ?? "Unkown"
        let currency = managed.currency ?? "Unkown"
        let primaryGenreName = managed.primaryGenreName ?? "Unkown"
        
        self.init(wrapperType: wrapperType,
                  artistId: artistId,
                  collectionId: collectionId,
                  artistName: artistName,
                  collectionName: collectionName,
                  collectionCensoredName: collectionCensoredName,
                  artistViewUrl: artistViewUrl,
                  collectionViewUrl: collectionViewUrl,
                  artworkUrl60: artworkUrl60,
                  artworkUrl100: artworkUrl100,
                  collectionPrice: collectionPrice,
                  collectionExplicitness: collectionExplicitness,
                  trackCount: trackCount,
                  copyright: copyright,
                  releaseDate: releaseDate,
                  country: country,
                  currency: currency,
                  primaryGenreName: primaryGenreName)
        
    }
}
