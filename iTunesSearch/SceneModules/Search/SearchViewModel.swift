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
    
    private var viewStateCompletion: ViewStateBlock?
    
    private var formatter: SearchViewDataFormatterProtocol
    private var operationManager: SearchOperationManagerProtocol
    private var lottieManager: LottieManagerProtocol
    
    private var viewData: SearchResponse?
    
    private var searchTerm: String!
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
    
    func subscribeSearchViewState(with completion: @escaping ViewStateBlock) {
        viewStateCompletion = completion
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
        viewStateCompletion?(.done)
    }
    
    private lazy var searchControllerTextChangeListener: TextChangeBlock = { [weak self] term in
        self?.formatter.clearData()
        self?.searchTerm = term ?? ""
        self?.searchTerm = self?.searchTerm.replacingOccurrences(of: " ", with: "+")
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

extension SearchViewModel: SegmentedControlProtocol {
    
    func changeIndex(to index: Int) {
        lottieManager.onPreExecute()
        mediaType = formatter.getMediaType(with: index)
        formatter.clearData()
        search()
        lottieManager.onPostExecute()
    }
}
