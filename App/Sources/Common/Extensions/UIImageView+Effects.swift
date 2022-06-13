//
//  UIImageView+Effects.swift
//  App
//
//  Created by Ney Pequeno (Contractor) on 13/06/22.
//

import Foundation
import UIKit


extension UIImageView {
    func applyBlur(style: UIBlurEffect.Style = .regular) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
}
