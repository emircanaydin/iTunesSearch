//
//  CollectionBorderData.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import Foundation

class CollectionBorderData {
    
    private(set) var collectionName: String
    private(set) var releaseDate: Date?
    private(set) var collectionPriceContainerData: PriceContainerData
    
    init(collectionName: String, releaseDate: Date?, collectionPriceContainerData: PriceContainerData) {
        self.collectionName = collectionName
        self.releaseDate = releaseDate
        self.collectionPriceContainerData = collectionPriceContainerData
    }
}
