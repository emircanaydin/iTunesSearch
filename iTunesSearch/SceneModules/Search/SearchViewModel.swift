//
//  SearchViewModel.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import Foundation
import RxSwift

class SearchViewModel {
    
    private let disposeBag = DisposeBag()
    
    private var searchViewStateCompletion: SearchViewStateBlock?
    
    private var formatter: SearchViewDataFormatterProtocol
    private var operationManager: SearchOperationManagerProtocol
    
    private var viewData: SearchResponse?
    
    private var searchTerm: String!
    
    init(formatter: SearchViewDataFormatterProtocol, operationManager: SearchOperationManagerProtocol) {
        self.formatter = formatter
        self.operationManager = operationManager
        subscribeOperationMangerPublisher()
    }
    
    func search() {
        operationManager.search(with: SearchRequest(term: searchTerm, entity: "musicTrack", offset: formatter.paginationInfo.offset))
    }
    
    func subscribeSearchViewState(with completion: @escaping SearchViewStateBlock) {
        searchViewStateCompletion = completion
    }
    
    func getSearchControllerComponentData() -> SearchControllerComponentData {
        return formatter.getSearchControllerComponentData(with: searchControllerTextChangeListener)
    }
 
    
    // MARK: - Private Methods
    private func subscribeOperationMangerPublisher() {
        operationManager.subscribeDataPublisher { [weak self] result in
            switch result {
            case .failure(let error):
                print("error: \(error)")
            case .success(let response):
                self?.formatter.setData(with: response)
                self?.dataHandler(with: response)
            }
        }.disposed(by: disposeBag)
    }
    
    private func dataHandler(with response: SearchResponse?) {
        formatter.paginationInfo.fetching = false
        viewData = response
        searchViewStateCompletion?(.done)
    }
    
    private lazy var searchControllerTextChangeListener: TextChangeBlock = { [weak self] term in
        self?.formatter.clearData(with: { finish in
            
            guard finish else { return }
            self?.searchTerm = term ?? ""
            self?.search()
        })
    }
}

// MARK: - ItemProviderProtocol
extension SearchViewModel: ItemProviderProtocol {
    
    func askNumberOfSection() -> Int {
        return formatter.getNumberOfSection()
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return formatter.getNumberOfItem(in: section)
    }
    
    func askData(at index: Int) -> GenericDataProtocol? {
        return formatter.getItem(at: index)
    }
    
    func isLoadingCell(for index: Int) -> Bool {
        return index >= formatter.getCount()
    }
    
    func getMoreData() {
        // Check to get more data
        guard formatter.paginationInfo.checkLoadingMore() else { return }
        formatter.paginationInfo.nextOffset()
        search()
    }
    
    func selectedItem(at index: Int) {
        // go to detail page
    }
    
    
}
