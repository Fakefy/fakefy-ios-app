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

protocol SearchViewModel {
    // Vars
    var delegate: SearchViewModelDelegate? { get set }
    var searchResults: [SearchResultUI] { get }
    
    // Actions
    func search(for term: String)
}

class SearchViewModelImpl: SearchViewModel {
    
    weak var delegate: SearchViewModelDelegate?
    
    // MARK: Vars
    private var searchTimer: Timer? = nil
    
    private(set) var searchResults: [SearchResultUI] = [] {
        didSet { delegate?.onSearchUpdated() }
    }
    
    // MARK: Business
    private let business: SearchBusiness
    
    // MARK: - Init
    init(business: SearchBusiness) {
        self.business = business
    }
}

// MARK: - Actions
extension SearchViewModelImpl {
    
    func search(for term: String) {
        guard !term.isEmpty else {
            searchResults = []
            return
        }
        delayedSearch(for: term)
    }
}

// MARK: - Timer
extension SearchViewModelImpl {
    
    private func delayedSearch(for term: String) {
        searchTimer?.invalidate()
        let searchContext = ["term": term]
        searchTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(triggerSearch), userInfo: searchContext, repeats: false)
        guard let searchTimer = searchTimer else { return }
        RunLoop.current.add(searchTimer, forMode: .common)
    }
    
    @objc private func triggerSearch(timer: Timer) {
        guard let context = timer.userInfo as? [String:String],
              let term = context["term"],
              !term.isEmpty else { return }
        peformSearch(for: term)
    }
}

// MARK: - Network
extension SearchViewModelImpl {
    
    private func peformSearch(for term: String) {
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
                
            case .failure:
                self?.searchResults = []
            }
        }
    }
}
