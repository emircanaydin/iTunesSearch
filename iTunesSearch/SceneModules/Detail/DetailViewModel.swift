//
//  DetailViewModel.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import Foundation
import RxSwift

class DetailViewModel {
    
    private let disposeBag = DisposeBag()
    
    private var viewDataStateCompletion: ViewDataStateBlock?
    
    private var formatter: DetailViewDataFormatterProtocol
    private var operationManager: LookupOperationManagerProtocol
    private var lottieManager: LottieManagerProtocol
    private var lookupRequest: LookupRequest
    
    init(lookupRequest: LookupRequest, formatter: DetailViewDataFormatterProtocol, operationManager: LookupOperationManagerProtocol, lottieManager: LottieManagerProtocol) {
        self.lookupRequest = lookupRequest
        self.formatter = formatter
        self.operationManager = operationManager
        self.lottieManager = lottieManager
        subscribeOperationMangerPublisher()
        getDetailData()
    }
    
    func getDetailData() {
        operationManager.getDetail(with: lookupRequest)
    }
    
    func subscribeViewDataState(with completion: @escaping ViewDataStateBlock) {
        viewDataStateCompletion = completion
    }
    
    func getDetailViewData() -> DetailViewComponentData {
        return formatter.getDetailViewComponentData()
    }
    
    // MARK: - Private Methods
    
    private func subscribeOperationMangerPublisher() {
        operationManager.subscribeDataPublisher { [weak self] result in
            switch result {
            case .failure(let error):
                self?.viewDataStateCompletion?(.failure)
            case .success(let response):
                self?.dataHandler(with: response)
            }
        }.disposed(by: disposeBag)
    }
    
    private func dataHandler(with response: SearchResponse?) {
        formatter.setData(with: response)
        viewDataStateCompletion?(.newData)
    }
}
