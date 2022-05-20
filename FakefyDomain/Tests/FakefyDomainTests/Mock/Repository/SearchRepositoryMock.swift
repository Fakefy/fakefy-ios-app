//
//  SearchRepositoryMock.swift
//  Fakefy Domain Tests
//
//  Created by Ney Moura on 30/10/21.
//

@testable import FakefyDomain

extension SearchRepository {
    func search<T>(request: SearchRequest, returning: T.Type, callback: @escaping (Result<[T], ITunesError>) -> Void) where T: Codable {}
}
