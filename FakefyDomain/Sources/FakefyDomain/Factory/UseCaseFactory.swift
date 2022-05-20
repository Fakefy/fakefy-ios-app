//
//  UseCaseFactory.swift
//  Fakefy Domain
//
//  Created by Ney Moura on 10/06/21.
//

public class UseCaseFactory {
    public static func makeSearchUseCase(searchRepository: SearchRepository) -> SearchAlbumUseCase {
        return SearchAlbumUseCaseImpl(searchRepository: searchRepository)
    }
}
