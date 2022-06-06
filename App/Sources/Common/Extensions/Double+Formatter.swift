//
//  Double+Formatter.swift
//  App
//
//  Created by Ney Moura on 13/06/21.
//

import Foundation

extension Double {
    func formatPrice(currency: String) -> String {
        let formatter = NumberFormatter()
        formatter.currencyCode = currency
        formatter.numberStyle = .currency
        return formatter.string(for: self) ?? " - " // TODO: Move to a strings file
    }
}
