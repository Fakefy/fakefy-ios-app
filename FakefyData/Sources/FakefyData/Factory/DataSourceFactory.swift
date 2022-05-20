//
//  DataSourceFactory.swift
//  FakefyData
//
//  Created by Ney Moura on 10/06/21.
//

import Moya

class DataSourceFactory {
    static func makeSearchRemoteDataSource(
        endpointClosure: @escaping ((SearchAPI) -> Endpoint) = MoyaProvider.defaultEndpointMapping,
        stubClosure: @escaping ((SearchAPI) -> Moya.StubBehavior) = MoyaProvider.neverStub) -> SearchRemoteDataSource {
        let provider = MoyaProvider<SearchAPI>(endpointClosure: endpointClosure, stubClosure: stubClosure)
        let config = ITunesConfig()
        return SearchRemoteDataSourceImpl(provider: provider, config: config)
    }
}
