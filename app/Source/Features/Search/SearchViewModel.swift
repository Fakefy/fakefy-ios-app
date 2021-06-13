//
//  SearchViewModel.swift
//  App
//
//  Created by Ney Moura on 13/06/21.
//

import Foundation
import TouchTunes_SDK

// TODO: Implement Unit tests

protocol SearchViewModelDelegate: AnyObject {
    func onSearchUpdated()
}

protocol SearchViewModelProtocol {
    // Vars
    var delegate: SearchViewModelDelegate? { get set }
    var searchResults: [SearchResultUI] { get }
    
    // Actions
    func search(for term: String)
}

class SearchViewModel: SearchViewModelProtocol {
    weak var delegate: SearchViewModelDelegate?
    
    // MARK: Vars
    private(set) var searchResults: [SearchResultUI] = []
    
    // MARK: Business
    private let business: SearchBusinessProtocol
    
    // MARK: - Init
    init(business: SearchBusinessProtocol) {
        self.business = business
    }
}

// MARK: - Actions
extension SearchViewModel {
    
    // TODO: To avoid service overload and excessive network traffic, we should implement a Buffer quering a search after sometime when the user stopped typing
    func search(for term: String) {
        
        // Search parameters
        let country: String = NSLocale(localeIdentifier: Locale.current.identifier).countryCode ?? "US"
        
        // TODO: Tune parameters for albums only
        let media = "music"
        let entity = "album"
        let attribute = "artistTerm"
        
        business.search(term: term,
                        country: country,
                        media: media,
                        entity: entity,
                        attribute: attribute) { [weak self] result in
            switch result {
            case .success(let results):
                self?.searchResults = results.map { SearchResultUI(result: $0) }
                self?.delegate?.onSearchUpdated()
                
            case .failure:
                self?.searchResults = []
                self?.delegate?.onSearchUpdated()
            }
        }
    }
}
