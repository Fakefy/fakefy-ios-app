//
//  SearchRemoteDataSource.swift
//  FakefyData
//
//  Created by Ney Moura on 11/11/21.
//

import FakefyDomain

protocol SearchRemoteDataSource {
    func search<T>(request: SearchRequest,
                   returning: T.Type,
                   callback: @escaping (Result<[T], ITunesError>) -> Void) where T: Codable
}
