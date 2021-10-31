//
//  TrackInfoComponentData.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import Foundation

class TrackInfoComponentData {
    
    private(set) var artistName: String
    private(set) var trackName: String
    
    init(artistName: String, trackName: String) {
        self.artistName = artistName
        self.trackName = trackName
    }
}
