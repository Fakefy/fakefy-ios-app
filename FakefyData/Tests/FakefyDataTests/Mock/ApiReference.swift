//
//  ApiReference.swift
//  FakefyData Tests
//
//  Created by Ney Moura on 11/06/21.
//

@testable import FakefyData
@testable import FakefyDomain

enum ApiReference {
    enum Search {
        static let config = ITunesConfig()
        static let search = SearchAPI.search(request: SearchRequest(term: "", country: "", media: "", entity: "", attribute: ""), config: config)
    }
}
