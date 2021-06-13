//
//  String+Formatter.swift
//  App
//
//  Created by Ney Moura on 13/06/21.
//

import Foundation

extension String {
    func formatDate(inputFormat: String = "yyyy-MM-dd'T'HH:mm:ss'Z'") -> String {
        let input = DateFormatter()
        input.dateFormat = inputFormat
        
        let output = DateFormatter()
        output.dateStyle = .long
        output.timeStyle = .none
        output.locale = Locale.current
        
        guard let date = input.date(from: self) else { return "" }
        return output.string(from: date)
    }
}
