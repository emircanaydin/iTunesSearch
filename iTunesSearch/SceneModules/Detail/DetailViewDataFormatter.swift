//
//  DetailViewDataFormatter.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import Foundation

class DetailViewDataFormatter: DetailViewDataFormatterProtocol {
    
    private var trackData: Wrapper!
    
    func getTrackImageUrl() -> String {
        return trackData.trackName
    }
    
    func getTrackInfoData() -> TrackInfoComponentData {
        return TrackInfoComponentData(artistName: trackData.artistName, trackName: trackData.trackName)
    }
    
    func getTrackPrice() -> Double {
        return trackData?.trackPrice ?? 0
    }
    
    func getDescription() -> String? {
        return trackData?.longDescription
    }
    
    func getCollectionBorderData() -> CollectionBorderData {
        return CollectionBorderData(collectionName: trackData.collectionName ?? trackData.trackName,
                                    releaseDate: trackData.releaseDate,
                                    collectionPriceContainerData: PriceContainerData(trackPrice: trackData.collectionPrice ?? trackData.trackPrice))
    }
    
    func setData(with response: SearchResponse) {
        
        guard response.resultCount > 0 else { return }
        
        trackData = response.results[0]
    }
    
    
}
