//
//  SearchRemoteDataSource.swift
//  FakefyData
//
//  Created by Ney Moura on 10/06/21.
//

import Moya
import FakefyDomain

class SearchRemoteDataSourceImpl {
    
    private let provider: MoyaProvider<SearchAPI>
    private let config: ITunesConfig
    
    init(provider: MoyaProvider<SearchAPI>, config: ITunesConfig) {
        self.provider = provider
        self.config = config
    }
}

// MARK: - Implementation
extension SearchRemoteDataSourceImpl: SearchRemoteDataSource {
    
    func search<T>(request: SearchRequest,
                   returning: T.Type,
                   callback: @escaping (Result<[T], ITunesError>) -> Void) where T: Codable {
        
        provider.request(.search(request: request, config: config)) {  result in
            switch result {
            case .success(let response):
                do {
                    let responseData = try response.map([T].self, atKeyPath: "results", using: JSONDecoder(), failsOnEmptyData: false)
                    callback(.success(responseData))
                } catch {
                    callback(.failure(ITunesError.init(type: .encoding)))
                }
            case .failure:
                callback(.failure(ITunesError.init(type: .generic)))
                break
            }
        }
    }
}
