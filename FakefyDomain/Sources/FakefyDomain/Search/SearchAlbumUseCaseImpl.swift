//
//  SearchAlbumUseCase.swift
//  Fakefy Domain
//
//  Created by Ney Moura on 10/06/21.
//

class SearchAlbumUseCaseImpl {
    
    private let searchRepository: SearchRepository
    
    init(searchRepository: SearchRepository) {
        self.searchRepository = searchRepository
    }
}

// MARK: - Business
extension SearchAlbumUseCaseImpl: SearchAlbumUseCase {
    func searchAlbum(with term: String, country: String, callback: @escaping (Result<[Album], ITunesError>) -> Void) {
        let media = "music"
        let entity = "album"
        let attribute = "albumTerm"
        let request = SearchRequest(term: term, country: country, media: media, entity: entity, attribute: attribute)
        searchRepository.search(request: request, returning: Album.self, callback: callback)
    }
}
