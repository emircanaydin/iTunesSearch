//
//  DetailViewComponentData.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import Foundation

class DetailViewComponentData {

    private(set) var imageData: CustomImageViewComponentData
    private(set) var trackInfoData: TrackTitleComponentData
    private(set) var purchaseButtonData: PurchaseButtonData
    private(set) var descriptionData: DescriptionTextComponentData
    private(set) var collectionContainerData: CollectionContainerComponentData
    
    init(imageData: CustomImageViewComponentData,
         trackInfoData: TrackTitleComponentData,
         purchaseButtonData: PurchaseButtonData,
         descriptionData: DescriptionTextComponentData,
         collectionContainerData: CollectionContainerComponentData) {
        
        self.imageData = imageData
        self.trackInfoData = trackInfoData
        self.purchaseButtonData = purchaseButtonData
        self.descriptionData = descriptionData
        self.collectionContainerData = collectionContainerData
    }
    
}
