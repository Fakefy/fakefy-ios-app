//
//  SearchRepository.swift
//  FakefyData
//
//  Created by Ney Moura on 30/10/21.
//

import FakefyDomain

class SearchRepositoryImpl {
    let remoteDataSource: SearchRemoteDataSource
    
    init(remoteDataSource: SearchRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - Implementation
extension SearchRepositoryImpl: SearchRepository {
    func search<T>(request: SearchRequest,
                   returning: T.Type,
                   callback: @escaping (Result<[T], ITunesError>) -> Void) where T: Codable {
        remoteDataSource.search(request: request, returning: T.self, callback: callback)
    }
}
