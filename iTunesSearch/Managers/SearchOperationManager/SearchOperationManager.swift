//
//  SearchOperationManager.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 25.10.2021.
//

import Foundation
import RxSwift
import DefaultNetworkOperationPackage

class SearchOperationManager: SearchOperationManagerProtocol {
    
    public static let shared = SearchOperationManager()
    
    private let dataPublishSubject = PublishSubject<SearchResult>()
    
    func search(with searchRequest: SearchRequest) {
        searchApiCall(searchRequest: searchRequest, with: apiCallHandler)
    }
    
    func subscribeDataPublisher(with completion: @escaping SearchResultBlock) -> Disposable {
        return dataPublishSubject.subscribe(onNext: completion)
    }
    
    // MARK: - Private Methods
    private func searchApiCall(searchRequest: SearchRequest, with completion: @escaping SearchResultBlock) {
        
        do {
            let urlRequest = try SearchServiceProvider(searchRequest: searchRequest).returnUrlRequest()
            APIManager.shared.cancelRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error {
            print("error \(error)")
        }
    }
    
    private lazy var apiCallHandler: SearchResultBlock = { [weak self] result in
        self?.dataPublishSubject.onNext(result)
    }
    
}
