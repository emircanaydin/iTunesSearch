//
//  LookupRequest.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import Foundation

typealias DetailViewRequestBlock = (LookupRequest) -> Void

struct LookupRequest: Codable {
    private (set) var id: Int
    
    init (id: Int) {
        self.id = id
    }
}
