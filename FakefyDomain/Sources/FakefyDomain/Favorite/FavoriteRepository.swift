//
//  FavoriteRepository.swift
//  Fakefy Domain
//
//  Created by Ney Moura on 11/11/21.
//

public protocol FavoriteRepository {
    func saveAlbum(album: Album, completion: (Result<Void, ITunesError>) -> Void)
    func fetchAlbums(completion: (Result<[Album], ITunesError>) -> Void)
}
