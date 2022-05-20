//
//  SearchAlbumUseCase.swift
//  Fakefy Domain
//
//  Created by Ney Moura on 11/11/21.
//

public protocol SearchAlbumUseCase {
    func searchAlbum(with term: String, country: String, callback: @escaping (Result<[Album], ITunesError>) -> Void)
}
