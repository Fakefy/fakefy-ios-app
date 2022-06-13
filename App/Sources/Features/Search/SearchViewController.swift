//
//  SearchViewController.swift
//  app
//
//  Created by Ney Moura on 12/06/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var viewModel: SearchViewModel
        
    // MARK: - Layout Vars
    private lazy var searchView: UISearchBar = {
        let search = UISearchBar().useConstraint()
        search.delegate = self
        search.accessibilityIdentifier = "searchView"
        search.accessibilityTraits = UIAccessibilityTraits.searchField
        return search
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped).useConstraint()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = SGColors.clear
        tableView.keyboardDismissMode = .onDrag
        tableView.register(cell: SearchResultCell.self)
        tableView.accessibilityIdentifier = "tableView"
        return tableView
    }()
    
    // MARK: - Inits
    required init?(coder: NSCoder) {
        fatalError("Unavailable init")
    }
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
        view.accessibilityIdentifier = "searchViewController"
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        tableView.reloadData()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(traitCollection)
        view.backgroundColor = SGColors.systemBackground
    }
    
    // MARK: - Setups
    private func setupLayout() {
        view.backgroundColor = SGColors.systemBackground
        
        view.addSubview(searchView)
        view.addSubview(tableView)
                
        searchView
            .height(constant: SGSearch.searchViewHeight)
            .top(anchor: view.safeAreaLayoutGuide.topAnchor)
            .leading(anchor: view.safeAreaLayoutGuide.leadingAnchor)
            .trailing(anchor: view.safeAreaLayoutGuide.trailingAnchor)
                
        tableView
            .top(anchor: searchView.bottomAnchor)
            .leading(anchor: view.safeAreaLayoutGuide.leadingAnchor)
            .trailing(anchor: view.safeAreaLayoutGuide.trailingAnchor)
            .bottom(anchor: view.bottomAnchor)
    }
}

// MARK: - Triggers
extension SearchViewController: SearchViewModelDelegate {
    func onSearchUpdated() {
        tableView.reloadData()
    }
}

// MARK: - TableView
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchResults.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .zero
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultCell.description(), for: indexPath) as? SearchResultCell
        cell?.delegate = self
        cell?.searchResult = viewModel.searchResults[indexPath.row]
        return cell ?? UITableViewCell()
    }
}

// MARK: - Search cell
extension SearchViewController: SearchResultCellDelegate {
    func didSelect(_ searchResult: AlbumUI) {
        let alert = UIAlertController(title: searchResult.name, message: searchResult.alertMessage, preferredStyle: .alert)
        // TODO: Move to strings file
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { _ in
            alert.dismiss(animated: true)
        })
        present(alert, animated: true)
    }
}

// MARK: - Search
extension SearchViewController: UISearchBarDelegate, UITextFieldDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(for: searchText)
    }
}
