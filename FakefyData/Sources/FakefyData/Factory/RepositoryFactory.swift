//
//  RepositoryFactory.swift
//  FakefyData
//
//  Created by Ney Moura on 30/10/21.
//

import FakefyDomain

public class RepositoryFactory {
    
    public static func makeSearchRepository() -> SearchRepository {
        return RepositoryFactory.makeSearchRepository(remoteDataSource: DataSourceFactory.makeSearchRemoteDataSource())
    }
    
    static func makeSearchRepository(remoteDataSource: SearchRemoteDataSource = DataSourceFactory.makeSearchRemoteDataSource()) -> SearchRepository {
        return SearchRepositoryImpl(remoteDataSource: remoteDataSource)
    }
}
