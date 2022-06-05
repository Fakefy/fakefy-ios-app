//
//  ViewControllerFactory.swift
//  App
//
//  Created by Ney Moura on 13/06/21.
//

class ViewControllerFactory {
    static func makeSearchViewController(
        viewModel: SearchViewModel = ViewModelFactory.makeSearchViewModel()
    ) -> SearchViewController {
        return SearchViewController(viewModel: viewModel)
    }
}
