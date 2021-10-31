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
        
        // Check if data is new
        if formatter.paginationInfo.offset != 0 {
            viewDataStateCompletion?(.moreData)
        } else {
            viewDataStateCompletion?(.newData)
        }
    }
    
    private lazy var searchControllerTextChangeListener: TextChangeBlock = { [weak self] term in
        self?.formatter.clearData()
        self?.searchTerm = term ?? ""
        self?.searchTerm = self?.searchTerm.replacingOccurrences(of: " ", with: "+") ?? ""
        self?.search()
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
    
    func isDataEmpty(in section: Int) -> Bool {
        guard formatter.getNumberOfItem(in: section) == 0 else { return false }
        guard searchTerm.count > 2 else { return false }
        return true
    }
    
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
    
    func changeIndex(to index: Int) {
        lottieManager.onPreExecute()
        mediaType = formatter.getMediaType(with: index)
        formatter.clearData()
        
        if searchTerm.count > 2 {
            search()
        }
        
        lottieManager.onPostExecute()
    }
}
