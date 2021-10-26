//
//  SearchViewBuilder.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 27.10.2021.
//

import UIKit

class SearchViewBuilder {
    
    class func build() -> UIViewController {
        let operationManager = SearchOperationManager.shared
        let formatter = SearchViewDataFormatter()
        let viewModel = SearchViewModel(formatter: formatter, operationManager: operationManager)
        let viewController = SearchViewController(viewModel: viewModel)
        
        viewController.title = "iTunesSearch"
        viewController.navigationController?.setNavigationBarHidden(false, animated: false)
        
        // Set view controller appearance
        let apperance = UINavigationBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.backgroundColor = .white
        viewController.navigationController?.navigationBar.standardAppearance = apperance;
        viewController.navigationController?.navigationBar.scrollEdgeAppearance = viewController.navigationController?.navigationBar.standardAppearance
        
        return viewController
    }
}
