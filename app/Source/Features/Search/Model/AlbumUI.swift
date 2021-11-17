//
//  AlbumUI.swift
//  App
//
//  Created by Ney Moura on 13/06/21.
//

import Foundation
import FakefyDomain

class AlbumUI {
    let artwork: String?
    let name: String
    let releaseDate: String
    let primaryGenre: String
    let price: String
    let copyright: String
    let alertMessage: String
    
    init(result: Album) {
        self.artwork = result.artworkUrl100 ?? result.artworkUrl100
        self.name = result.collectionName
        self.releaseDate = result.releaseDate?.formatDate() ?? " No release date " // Move to strings file
        self.primaryGenre = result.primaryGenreName
        self.price = result.collectionPrice.formatPrice(currency: result.currency)
        self.copyright = result.copyright ?? "No copyright" // Move to strings file
        self.alertMessage = "\(primaryGenre) \n \(price) \n \(copyright)"
    }
}
