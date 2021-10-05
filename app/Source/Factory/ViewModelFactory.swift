//
//  ViewModelFactory.swift
//  App
//
//  Created by Ney Moura on 13/06/21.
//

import TouchTunes_SDK

class ViewModelFactory {
    static func getSearchViewModel(business: SearchBusiness = TouchTunesFactory.getSearchBusiness()) -> SearchViewModel {
        return SearchViewModelImpl(business: business)
    }
}
