//
//  LookUpServiceProvider.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class LookupServiceProvider: ApiServiceProvider<LookupRequest> {
    
    init(lookupRequest: LookupRequest) {
        super.init(method: .get, baseUrl: BaseUrl.iTunes.rawValue, path: Paths.lookup.value, data: lookupRequest)
    }
}
