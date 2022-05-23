//
//  Mirror+CopyAttributes.swift
//  FakefyData
//
//  Created by Ney Moura on 01/11/21.
//

import Foundation

extension Mirror {
    func copyAttributes(into target: AnyObject) {
        children.forEach { element in
            if let label = element.label {
                target.setValue(element.value, forKey: label)
            }
        }
    }
}
