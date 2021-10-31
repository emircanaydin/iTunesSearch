//
//  SearchOperationManagerProtocol.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 25.10.2021.
//

import Foundation
import RxSwift

protocol SearchOperationManagerProtocol {
    
    func search(with searchRequest: SearchRequest)
    func subscribeDataPublisher(with completion: @escaping SearchResultBlock) -> Disposable
}
