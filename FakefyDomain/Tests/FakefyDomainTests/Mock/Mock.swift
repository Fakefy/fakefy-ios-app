//
//  Mock.swift
//  Fakefy Domain Tests
//
//  Created by Ney Moura on 11/06/21.
//

import Foundation

class Mock {
    
    private func dataFromFile(name: String, `extension`: String) -> Data {
        let bundle = Bundle.module
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
