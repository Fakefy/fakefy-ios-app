//
//  SearchResultDetailViewController.swift
//  App
//
//  Created by Ney Moura on 13/06/21.
//

import UIKit

class SearchResultDetailViewController: UIViewController {
    
    // MARK: - Vars
    var searchResult: SearchResultUI? {
        didSet { setupValues() }
    }
    
    // MARK: - Layout vars
    private lazy var primaryGenreLabel: UILabel = {
        let label = UILabel().useConstraint()
        return label
    }()
    
    // TODO: Missing style guide
    private lazy var priceLabel: UILabel = {
        let label = UILabel().useConstraint()
        return label
    }()
    
    // TODO: Missing style guide
    private lazy var copyrightLabel: UILabel = {
        let label = UILabel().useConstraint()
        return label
    }()
    
    private lazy var infoStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [primaryGenreLabel, priceLabel, copyrightLabel]).useConstraint()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = SGValues.Vertical.single
        return stack
    }()

    // MARK: - Inits
    required init?(coder: NSCoder) {
        fatalError("Unavailable init")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        setupLayout()
    }
    
    // MARK: - Setups
    private func setupLayout() {
        view.addSubview(infoStack)
        infoStack
            .top(anchor: view.topAnchor, constant: SGValues.Vertical.single)
            .leading(anchor: view.trailingAnchor, constant: SGValues.Horizontal.double)
            .trailing(anchor: view.trailingAnchor, constant: -SGValues.Horizontal.single)
            .bottom(anchor: view.bottomAnchor, constant: -SGValues.Vertical.single)
    }
    
    private func setupValues() {
        guard let searchResult = searchResult else { return }
        primaryGenreLabel.text = searchResult.primaryGenre
        priceLabel.text = searchResult.price
        copyrightLabel.text = searchResult.copyright
    }
}
