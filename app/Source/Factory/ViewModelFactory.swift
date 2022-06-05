//
//  ViewModelFactory.swift
//  App
//
//  Created by Ney Moura on 13/06/21.
//

import FakefyDomain
import FakefyData

class ViewModelFactory {
    static func makeSearchViewModel() -> SearchViewModel {
        let repository = RepositoryFactory.makeSearchRepository()
        let useCase = UseCaseFactory.makeSearchUseCase(searchRepository: repository)
        return SearchViewModelImpl(useCase: useCase)
    }
}
