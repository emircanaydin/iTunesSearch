//
//  SearchViewController.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 27.10.2021.
//

import UIKit

class SearchViewController: BaseViewController<SearchViewModel> {
    
    private var searchControllerComponent: SearchControllerComponent!
    
    override func prepareViewControllerConfigurations() {
        view.backgroundColor = .white
        addSearchComponent()
    }
    
    // MARK: - Private Methods
    private func addSearchComponent() {
        searchControllerComponent = SearchControllerComponent(viewModel: viewModel.getSearchControllerComponentData())
        navigationItem.searchController = searchControllerComponent
    }
}
