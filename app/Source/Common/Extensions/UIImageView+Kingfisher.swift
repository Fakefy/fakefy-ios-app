//
//  UIImageView+Kingfisher.swift
//  App
//
//  Created by Ney Moura on 24/06/21.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func load(imageUrl: String?) {
        guard let imageUrl = imageUrl, let url = URL(string: imageUrl) else { return }
        kf.setImage(with: url,
                    options: [
                        .transition(.fade(0.5))
                    ])
    }
}

