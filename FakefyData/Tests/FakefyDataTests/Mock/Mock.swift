//
//  Mock.swift
//  FakefyData Tests
//
//  Created by Ney Moura on 11/06/21.
//

import Moya

// MARK: - API
class Mock {
    func mock(api: Moya.TargetType, status: Int, data: Data) -> (_ target: Moya.TargetType) -> Endpoint {
        return { (target: Moya.TargetType) -> Endpoint in
            return Endpoint(url: target.baseURL.appendingPathComponent(target.path).absoluteString,
                            sampleResponseClosure: { .networkResponse(status, data) },
                            method: target.method,
                            task: target.task,
                            httpHeaderFields: target.headers)
        }
    }
}

// MARK: - Files
extension Mock {
    private func dataFromFile(name: String, `extension`: String) -> Data {
        let bundle = Bundle(for: type(of: self))
        if let file = bundle.url(forResource: name, withExtension: `extension`) {
            let json = try? String(contentsOf: file, encoding: .utf8)
            return json?.data(using: .utf8) ?? Data()
        }
        return Data()
    }
    
    func dataFromJson(named: String) -> Data {
        return dataFromFile(name: named, extension: "json")
    }
}
