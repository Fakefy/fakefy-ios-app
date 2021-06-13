//
//  ViewControllerFactory.swift
//  App
//
//  Created by Ney Moura on 13/06/21.
//

class ViewControllerFactory {
    static func getSearchViewController(
        viewModel: SearchViewModelProtocol = ViewModelFactory.getSearchViewModel()
    ) -> SearchViewController {
        return SearchViewController(viewModel: viewModel)
    }
}
