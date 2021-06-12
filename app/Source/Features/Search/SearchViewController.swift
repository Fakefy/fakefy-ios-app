//
//  SearchViewController.swift
//  app
//
//  Created by Ney Moura on 12/06/21.
//

import UIKit
import TouchTunes_SDK

class SearchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        TouchTunesFactory.getSearchBusiness().search(term: "Queen", country: "US", media: "music", entity: "album", attribute: "artistTerm") { searchResult in
            switch searchResult {
            case .success(let searchData):
                print(String(describing: searchData.first?.artistName))
            case .failure(let error):
                print(error)
            }
        }
    }
}
