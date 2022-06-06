//
//  UITableView+Register.swift
//  App
//
//  Created by Ney Moura on 13/06/21.
//

import UIKit

extension UITableView {
    @discardableResult
    func register(cell: AnyClass) -> Self {
        register(cell, forCellReuseIdentifier: cell.description())
        return self
    }
}
