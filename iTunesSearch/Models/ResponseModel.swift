//
//  ResponseModel.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 25.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

typealias SearchResult = Result<SearchResponse, ErrorResponse>
typealias SearchResultBlock = (Result<SearchResponse, ErrorResponse>) -> Void

// MARK: - SearchResponse
struct SearchResponse: Codable {
    let resultCount: Int
    let results: [Wrapper]
}

// MARK: - Wrapper
struct Wrapper: Codable {
    let artistID: Int?
    let collectionID, trackID: Int
    let artistName, collectionName, trackName: String
    let collectionViewURL, trackViewURL: String
    let artworkUrl100: String
    let collectionPrice: Double?
    let releaseDate: Date
}
