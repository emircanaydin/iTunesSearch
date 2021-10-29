//
//  DetailViewComponentData.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import Foundation

class DetailViewComponentData {

    private(set) var imageData: CustomImageViewComponentData
    private(set) var trackInfoData: TrackInfoComponentData
    private(set) var purchaseButtonData: PurchaseButtonData
    private(set) var descriptionData: DescriptionData
    private(set) var collectionBorderData: CollectionBorderData
    
    init(imageData: CustomImageViewComponentData,
         trackInfoData: TrackInfoComponentData,
         purchaseButtonData: PurchaseButtonData,
         descriptionData: DescriptionData,
         collectionBorderData: CollectionBorderData) {
        
        self.imageData = imageData
        self.trackInfoData = trackInfoData
        self.purchaseButtonData = purchaseButtonData
        self.descriptionData = descriptionData
        self.collectionBorderData = collectionBorderData
    }
    
}
