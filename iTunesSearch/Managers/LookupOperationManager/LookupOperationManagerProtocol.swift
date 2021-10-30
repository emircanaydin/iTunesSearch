//
//  LookupOperationManagerProtocol.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import Foundation
import RxSwift

protocol LookupOperationManagerProtocol {
    
    func getDetail(with lookupRequest: LookupRequest)
    func subscribeDataPublisher(with completion: @escaping LookupResultBlock) -> Disposable
}
