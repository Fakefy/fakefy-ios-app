//
//  CoverInspectorViewController.swift
//  App
//
//  Created by Ney Pequeno (Contractor) on 13/06/22.
//

import Foundation
import UIKit

class CoverInspectorViewController: UIViewController {
    
    private var viewModel: CoverInspectorViewModel
        
    // MARK: - Layout Vars
    private lazy var backImage: UIImageView = {
        let image = UIImageView().useConstraint()
        image.accessibilityIdentifier = "backImage"
        image.contentMode = .scaleAspectFill
        image.applyBlur()
        return image
    }()
    
    private lazy var frontImage: UIImageView = {
        let image = UIImageView().useConstraint()
        image.accessibilityIdentifier = "frontImage"
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // MARK: - Inits
    required init?(coder: NSCoder) {
        fatalError("Unavailable init")
    }
    
    init(viewModel: CoverInspectorViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        view.accessibilityIdentifier = "coverInspectorViewController"
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupValues()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(traitCollection)
        view.backgroundColor = SGColors.systemBackground
    }
    
    // MARK: - Setups
    private func setupLayout() {
        view.backgroundColor = SGColors.systemBackground
        
        view.addSubview(backImage)
        view.addSubview(frontImage)

        backImage
            .top(anchor: view.topAnchor)
            .leading(anchor: view.leadingAnchor)
            .trailing(anchor: view.trailingAnchor)
            .bottom(anchor: view.bottomAnchor)
                
        frontImage
            .top(anchor: view.safeAreaLayoutGuide.topAnchor, constant: SGValues.Vertical.double)
            .leading(anchor: view.safeAreaLayoutGuide.leadingAnchor, constant: SGValues.Vertical.double)
            .trailing(anchor: view.safeAreaLayoutGuide.trailingAnchor, constant: -SGValues.Vertical.double)
            .bottom(anchor: view.safeAreaLayoutGuide.bottomAnchor, constant: -SGValues.Vertical.double)
    }
    
    private func setupValues() {
        let coverUrl = viewModel.cover.coverUrl
        backImage.load(imageUrl: coverUrl)
        frontImage.load(imageUrl: coverUrl)
    }
}
