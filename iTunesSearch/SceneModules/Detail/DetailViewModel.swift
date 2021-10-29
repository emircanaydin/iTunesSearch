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
    
    private var viewStateCompletion: ViewStateBlock?
    
    private var formatter: DetailViewDataFormatterProtocol
    private var operationManager: LookupOperationManagerProtocol
    private var lottieManager: LottieManagerProtocol
    
    init(formatter: DetailViewDataFormatterProtocol, operationManager: LookupOperationManagerProtocol, lottieManager: LottieManagerProtocol) {
        self.formatter = formatter
        self.operationManager = operationManager
        self.lottieManager = lottieManager
    }
    
    func getDetailData() {
        operationManager.getDetail(with: LookupRequest(id: 12))
    }
    
    func subscribeViewState(with completion: @escaping ViewStateBlock) {
        viewStateCompletion = completion
    }
    
    func getDetailViewData() -> DetailViewComponentData {
        return formatter.getDetailViewComponentData()
    }
    
    // MARK: - Private Methods
    
    private func subscribeOperationMangerPublisher() {
        operationManager.subscribeDataPublisher { [weak self] result in
            switch result {
            case .failure(let error):
                print("error \(error)")
                self?.viewStateCompletion?(.failure)
            case .success(let response):
                self?.dataHandler(with: response)
            }
        }.disposed(by: disposeBag)
    }
    
    private func dataHandler(with response: SearchResponse?) {
        viewStateCompletion?(.done)
    }
}
