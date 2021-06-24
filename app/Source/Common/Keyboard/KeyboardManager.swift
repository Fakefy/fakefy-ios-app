//
//  KeyboardManager.swift
//  App
//
//  Created by Ney Moura on 24/06/21.
//

import UIKit

protocol KeyboardManagerDelegate: AnyObject {
    var mainView: UIView { get }
    var editingViews: [UIView] { get }
}

class KeyboardManager {
    
    weak var delegate: KeyboardManagerDelegate?
    
    func setup() {
        let gesture = UIGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        gesture.cancelsTouchesInView = true
        delegate?.mainView.addGestureRecognizer(gesture)
    }
    
    @objc func dismissKeyboard(_ gesture: UIGestureRecognizer) {
        delegate?.editingViews.forEach { view in
            view.endEditing(true)
        }
    }
}
