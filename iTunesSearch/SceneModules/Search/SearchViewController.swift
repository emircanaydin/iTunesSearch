//
//  SearchViewController.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 27.10.2021.
//

import UIKit

class SearchViewController: BaseViewController<SearchViewModel> {
    
    private var searchResultCollection: ItemCollectionView!
    private var searchControllerComponent: SearchControllerComponent!
    
    override func prepareViewControllerConfigurations() {
        view.backgroundColor = .white
        addSearchComponent()
        addSearchResultCollection()
    }
    
    // MARK: - Private Methods
    private func addSearchComponent() {
        searchControllerComponent = SearchControllerComponent(viewModel: viewModel.getSearchControllerComponentData())
        navigationItem.searchController = searchControllerComponent
    }
    
    private func addSearchResultCollection() {
        searchResultCollection = ItemCollectionView()
        searchResultCollection.translatesAutoresizingMaskIntoConstraints = false
        searchResultCollection.delegate = viewModel
        
        view.addSubview(searchResultCollection)
        
        NSLayoutConstraint.activate([
            
            searchResultCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchResultCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchResultCollection.topAnchor.constraint(equalTo: view.topAnchor),
            searchResultCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
