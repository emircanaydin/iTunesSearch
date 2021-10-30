//
//  SearchControllerComponent.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import Foundation
import UIKit

class SearchControllerComponent: BaseSearchController<SearchControllerComponentData> {
    
    private var searchWorkItem: DispatchWorkItem?
    private var lastTerm = ""
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        self.searchResultsUpdater = self
    }
    
    
}

// MARK: - UISearchResultsUpdating
extension SearchControllerComponent: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        searchWorkItem?.cancel()
        
        // Check if term count is more than 2
        guard let term = searchController.searchBar.text, term.count > 2, lastTerm != term else {
            return
        }
        
        let newTask = DispatchWorkItem { [weak self] in
            self?.lastTerm = term
            self?.viewModel.textChangeListener?(term)
        }
        
        self.searchWorkItem = newTask
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: newTask)
    }
}
