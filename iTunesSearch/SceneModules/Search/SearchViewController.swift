//
//  SearchViewController.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 27.10.2021.
//

import UIKit

class SearchViewController: BaseViewController<SearchViewModel> {
    
    private lazy var searchResultCollection: ItemCollectionView = {
        let temp = ItemCollectionView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var segmentedControl: SegmentedControlComponent = {
        let temp = SegmentedControlComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return temp
    }()
    
    private lazy var searchResultTitleLabel: SearchResultTitleComponent = {
        let temp = SearchResultTitleComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [segmentedControl, searchResultTitleLabel, searchResultCollection])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.distribution = .fill
        temp.alignment = .fill
        temp.spacing = 10
        return temp
    }()
    
    private var searchControllerComponent: SearchControllerComponent!
    
    override func prepareViewControllerConfigurations() {
        addSearchComponent()
        addSearchResultCollection()
        addListeners()
    }
    
    // MARK: - Private Methods
    private func addSearchComponent() {
        searchControllerComponent = SearchControllerComponent(viewModel: viewModel.getSearchControllerComponentData())
        navigationItem.searchController = searchControllerComponent
    }
    
    private func addSearchResultCollection() {
        searchResultCollection.delegate = viewModel
        
        segmentedControl.setData(by: viewModel.getSegmentedControlData())
        
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func addListeners() {
        viewModel.subscribeViewDataState { [weak self] state in
            switch state {
            case .loading, .failure:
                return
            case .moreData:
                self?.searchResultCollection.reloadCollectionView()
            case .newData:
                self?.searchResultCollection.reloadCollectionView()
                self?.searchResultCollection.scrollToTop()
                
                var searchTerm = self?.viewModel.getSearchTerm() ?? ""
                searchTerm = searchTerm.replacingOccurrences(of: "+", with: " ")
                self?.searchResultTitleLabel.setData(by: SearchResultTitleData(searchTerm: searchTerm))
            }
        }
        
        viewModel.subscribeDetailViewState { [weak self] lookupRequest in
            self?.fireDetailView(with: lookupRequest)
        }
    }
    
    private func fireDetailView(with lookupRequest: LookupRequest) {
        let detailVC = DetailViewBuilder.build(with: lookupRequest)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
