//
//  SearchRequest.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 25.10.2021.
//

import Foundation

struct SearchRequest: Codable {
    private (set) var term: String
    private (set) var media: String
    private (set) var offset: Int
    private (set) var limit: Int = 20
    private (set) var country: String = "tr"
    
    init (term: String, media: String, offset: Int) {
        self.term = term
        self.media = media
        self.offset = offset
    }
}
