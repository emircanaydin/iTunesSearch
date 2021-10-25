//
//  SearchServiceProvider.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 25.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class SearchServiceProvider: ApiServiceProvider<SearchRequest> {
    
    init(searchRequest: SearchRequest) {
        super.init(method: .get, baseUrl: BaseUrl.iTunes.rawValue, path: Paths.search.value, data: searchRequest)
    }
}
