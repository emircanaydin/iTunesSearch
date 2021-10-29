//
//  DetailViewDataFormatterProtocol.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import Foundation

protocol DetailViewDataFormatterProtocol {
    
    func getTrackImageUrl() -> String?
    func getTrackInfoData() -> TrackInfoComponentData?
    func getTrackPrice() -> Double?
    func getDescription() -> String?
    func getCollectionBorderData() -> CollectionBorderData?
    func setData(with response: SearchResponse)
}
