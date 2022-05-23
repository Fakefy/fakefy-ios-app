//
//  ITunesError.swift
//  Fakefy Domain
//
//  Created by Ney Moura on 10/06/21.
//

public struct ITunesError: Error {

    public enum ErrorType: CaseIterable {
        case generic
        case encoding
    }
    
    public let type: ErrorType
        
    public init(type: ErrorType = .generic) {
        self.type = type
    }
}
