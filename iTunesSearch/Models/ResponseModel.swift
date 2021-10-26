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
    let collectionID: Int
    let trackID: Int
    let artistName: String
    let collectionName: String
    let trackName: String
    let collectionViewURL: String
    let trackViewURL: String
    let artworkUrl100: String
    let trackPrice: Double?
    let collectionPrice: Double?
    let releaseDate: Date
}

