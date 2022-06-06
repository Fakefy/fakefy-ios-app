//
//  SearchViewModel.swift
//  App
//
//  Created by Ney Moura on 13/06/21.
//

import Foundation
import FakefyDomain

// TODO: Implement Unit tests

protocol SearchViewModelDelegate: AnyObject {
    func onSearchUpdated()
}

protocol SearchViewModel {
    // Vars
    var delegate: SearchViewModelDelegate? { get set }
    var searchResults: [AlbumUI] { get }
    
    // Actions
    func search(for term: String)
}

class SearchViewModelImpl: SearchViewModel {
    
    private let searchContextTermKey: String = "term"
    private let defaultCountry: String = "US"
    
    weak var delegate: SearchViewModelDelegate?
    
    // MARK: Vars
    private var searchTimer: Timer? = nil
    
    private(set) var searchResults: [AlbumUI] = [] {
        didSet { delegate?.onSearchUpdated() }
    }
    
    // MARK: Business
    private let useCase: SearchAlbumUseCase
    
    // MARK: - Init
    init(useCase: SearchAlbumUseCase) {
        self.useCase = useCase
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
        let searchContext = [searchContextTermKey: term]
        searchTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(triggerSearch), userInfo: searchContext, repeats: false)
        guard let searchTimer = searchTimer else { return }
        RunLoop.current.add(searchTimer, forMode: .common)
    }
    
    @objc private func triggerSearch(timer: Timer) {
        guard let context = timer.userInfo as? [String:String],
              let term = context[searchContextTermKey],
              !term.isEmpty else { return }
        peformSearch(for: term)
    }
}

// MARK: - Network
extension SearchViewModelImpl {
    
    private func peformSearch(for term: String) {
        let country: String = NSLocale(localeIdentifier: Locale.current.identifier).countryCode ?? defaultCountry
        
        useCase.searchAlbum(with: term, country: country) { [weak self] result in
            switch result {
            case .success(let results):
                self?.searchResults = results.map { AlbumUI(result: $0) }
                
            case .failure:
                self?.searchResults = []
            }
        }
    }
}
