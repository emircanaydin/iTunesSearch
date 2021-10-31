//
//  EndpointHelper.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 25.10.2021.
//

import Foundation

typealias BaseUrl = EndpointHelper.BaseUrl
typealias Paths = EndpointHelper.Paths
typealias MediaTypes = EndpointHelper.MediaTypes

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
            case.lookup:
                return "lookup"
            }
        }
        
        case search
        case lookup
    }
    
    enum MediaTypes: GenericValueProtocol {
        
        typealias Value = String
        
        var value: String {
            switch self {
            case .musicTrack:
                return "musicTrack"
            case .movie:
                return "movie"
            case .software:
                return "software"
            case .ebook:
                return "ebook"
            }
        }
        
        case musicTrack
        case movie
        case software
        case ebook
        
    }
}
