//
//  WrapperInfoData.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import Foundation

class WrapperInfoComponentData {

    private(set) var artistName: String
    private(set) var trackName: String
    private(set) var collectionName: String
    
    init(artistName: String, trackName: String, collectionName: String) {
        self.artistName = artistName
        self.trackName = trackName
        self.collectionName = collectionName
    }
}
