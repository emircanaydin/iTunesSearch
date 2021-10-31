//
//  LookupOperationManager.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import Foundation
import RxSwift
import DefaultNetworkOperationPackage

class LookupOperationManager: LookupOperationManagerProtocol {
    
    public static let shared = LookupOperationManager()
    
    private let dataPublishSubject = PublishSubject<LookupResult>()
    
    func getDetail(with lookupRequest: LookupRequest) {
        lookupApiCall(lookupRequest: lookupRequest, with: apiCallHandler)
    }
    
    func subscribeDataPublisher(with completion: @escaping LookupResultBlock) -> Disposable {
        dataPublishSubject.subscribe(onNext: completion)
    }
    
    // MARK: - Private Methods
    private func lookupApiCall(lookupRequest: LookupRequest, with completion: @escaping SearchResultBlock) {
        
        do {
            let urlRequest = try LookupServiceProvider(lookupRequest: lookupRequest).returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error { }
    }
    
    private lazy var apiCallHandler: LookupResultBlock = { [weak self] result in
        self?.dataPublishSubject.onNext(result)
    }
    
}
