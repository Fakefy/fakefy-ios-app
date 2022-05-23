//
//  SearchAPI.swift
//  FakefyData
//
//  Created by Ney Moura on 10/06/21.
//

import Moya
import Foundation
import FakefyDomain

enum SearchAPI {
    case search(request: SearchRequest, config: ITunesConfig)
}

extension SearchAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .search(_, let config):
            return try! config.baseURL.asURL()
        }
    }
    
    var path: String {
        switch self {
        case .search:
            return "/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .search(let request, _):
            var parameters: [String: Any] = [:]
            parameters["term"] = request.term
            parameters["country"] = request.country
            parameters["media"] = request.media
            parameters["entity"] = request.entity
            parameters["attribute"] = request.attribute
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}
