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
    
    private var viewDataStateCompletion: ViewDataStateBlock?
    private var detailViewState: DetailViewRequestBlock?
    
    private var formatter: SearchViewDataFormatterProtocol
    private var operationManager: SearchOperationManagerProtocol
    private var lottieManager: LottieManagerProtocol
    
    private var viewData: SearchResponse?
    
    private var searchTerm: String = ""
    private var mediaType: String = "musicTrack"
    
    init(formatter: SearchViewDataFormatterProtocol, operationManager: SearchOperationManagerProtocol, lottieManager: LottieManagerProtocol) {
        self.formatter = formatter
        self.operationManager = operationManager
        self.lottieManager = lottieManager
        subscribeOperationMangerPublisher()
    }
    
    // Makes the search request
    func search() {
        operationManager.search(with: SearchRequest(term: searchTerm, entity: mediaType, offset: formatter.paginationInfo.offset))
    }
    
    func subscribeViewDataState(with completion: @escaping ViewDataStateBlock) {
        viewDataStateCompletion = completion
    }
    
    func subscribeDetailViewState(with completion: @escaping DetailViewRequestBlock) {
        detailViewState = completion
    }
    
    func getSearchControllerComponentData() -> SearchControllerComponentData {
        return formatter.getSearchControllerComponentData(with: searchControllerTextChangeListener)
    }
    
    func getSegmentedControlData() -> SegmentedControlData {
        return formatter.getSegmentedControllerData(with: self)
    }
    
    func getSearchTerm() -> String {
        return searchTerm
    }
    
    // MARK: - Private Methods
    private func subscribeOperationMangerPublisher() {
        operationManager.subscribeDataPublisher { [weak self] result in
            switch result {
            case .failure(_):
                break
            case .success(let response):
                self?.formatter.setData(with: response)
                self?.dataHandler(with: response)
            }
        }.disposed(by: disposeBag)
    }
    
    // Handles data from api
    private func dataHandler(with response: SearchResponse?) {
        formatter.paginationInfo.fetching = false
        viewData = response
        
        // Check if data is new
        if formatter.paginationInfo.offset != 0 {
            viewDataStateCompletion?(.moreData)
        } else {
            viewDataStateCompletion?(.newData)
        }
    }
    
    // When term is change this function is fired. Clears the list, returns new data by term.
    private lazy var searchControllerTextChangeListener: TextChangeBlock = { [weak self] term in
        self?.formatter.clearData()
        self?.searchTerm = term ?? ""
        self?.searchTerm = self?.searchTerm.replacingOccurrences(of: " ", with: "+") ?? ""
        self?.search()
    }
}

// MARK: - ItemProviderProtocol
extension SearchViewModel: ItemProviderProtocol {
    
    // Return item count in section
    func askNumberOfItem(in section: Int) -> Int {
        return formatter.getNumberOfItem(in: section)
    }
    
    // Return item data
    func askData(at index: Int) -> GenericDataProtocol? {
        return formatter.getItem(at: index)
    }
    
    // Check is cell Loading Cell. If index is last index in list return true
    func isLoadingCell(for index: Int) -> Bool {
        return index >= formatter.getCount()
    }
    
    // Check is data empty. If a term is entered and there are 0 elements in the list return true
    func isDataEmpty(in section: Int) -> Bool {
        guard formatter.getNumberOfItem(in: section) == 0 else { return false }
        guard searchTerm.count > 2 else { return false }
        return true
    }
    
    // Fetches the next offset data
    func getMoreData() {
        // Check to get more data
        guard formatter.paginationInfo.checkLoadingMore() else { return }
        formatter.paginationInfo.nextOffset()
        search()
    }
    
    func selectedItem(at index: Int) {
        detailViewState?(LookupRequest(id: formatter.getItemId(at: index)))
    }
}

extension SearchViewModel: SegmentedControlProtocol {
    
    // When the selected segment index changes, it clears the list, returns the result of the selected media type according to the term
    func changeSelectedSegmentIndex(to index: Int) {
        lottieManager.onPreExecute()
        mediaType = formatter.getMediaType(with: index)
        formatter.clearData()
        
        if searchTerm.count > 2 {
            search()
        }
        
        lottieManager.onPostExecute()
    }
}
