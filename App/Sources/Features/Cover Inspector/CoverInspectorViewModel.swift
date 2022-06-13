//
//  CoverInspectorViewModel.swift
//  App
//
//  Created by Ney Pequeno (Contractor) on 13/06/22.
//

import Foundation


protocol CoverInspectorViewModel {
    var cover: CoverUI { get }
}

class CoverInspectorViewModelImpl: CoverInspectorViewModel {
    let cover: CoverUI
    
    init(cover: CoverUI) {
        self.cover = cover
    }
}
