//
//  CoverUI.swift
//  App
//
//  Created by Ney Pequeno (Contractor) on 13/06/22.
//

import Foundation

struct CoverUI {
    let coverUrl: String?
    
    init(coverUrl: String?) {
        self.coverUrl = coverUrl
    }
    
    init(albumUI: AlbumUI) {
        self.init(coverUrl: albumUI.artwork)
    }
}
