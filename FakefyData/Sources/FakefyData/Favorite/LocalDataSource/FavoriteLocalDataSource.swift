//
//  FavoriteLocalDataSource.swift
//  FakefyData
//
//  Created by Ney Moura on 11/11/21.
//

import FakefyDomain

protocol FavoriteLocalDataSource {
    func saveAlbum(album: Album, completion: (Result<Void, ITunesError>) -> Void)
    func fetchAlbums(completion: (Result<[Album], ITunesError>) -> Void)
}
