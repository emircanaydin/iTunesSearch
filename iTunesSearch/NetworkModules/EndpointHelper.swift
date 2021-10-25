//
//  EndpointHelper.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 25.10.2021.
//

import Foundation

typealias BaseUrl = EndpointHelper.BaseUrl
typealias Paths = EndpointHelper.Paths

enum EndpointHelper {
    
    enum BaseUrl: String {
        case iTunes = "https://itunes.apple.com/"
    }
    
    enum Paths: GenericValueProtocol {
        
        typealias Value = String
        
        var value: String {
            switch self {
            case .search:
                return "search"
            }
        }
        
        case search
    }
}
