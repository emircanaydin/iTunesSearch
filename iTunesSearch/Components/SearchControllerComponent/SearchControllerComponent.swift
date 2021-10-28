//
//  SearchControllerComponent.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import Foundation
import UIKit

class SearchControllerComponent: BaseSearchController<SearchControllerComponentData> {
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        self.searchResultsUpdater = self
    }
    
}

// MARK: - UISearchResultsUpdating
extension SearchControllerComponent: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        // Check if term count is more than 2
        guard let term = searchController.searchBar.text, term.count > 2 else {
            return
        }
        
        viewModel.textChangeListener?(term)
    }
}
