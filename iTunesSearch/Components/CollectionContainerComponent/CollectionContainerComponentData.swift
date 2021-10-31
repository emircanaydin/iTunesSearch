//
//  CollectionBorderData.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import Foundation

class CollectionContainerComponentData {
    
    private(set) var collectionName: String
    private(set) var releaseDate: String?
    private(set) var collectionPriceContainerData: PriceContainerData
    
    init(collectionName: String, releaseDate: String?, collectionPriceContainerData: PriceContainerData) {
        self.collectionName = collectionName
        self.releaseDate = releaseDate
        self.collectionPriceContainerData = collectionPriceContainerData
    }
}
