//
//  WrapperCardData.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import Foundation

class WrapperCardData {
    
    private(set) var imageData: CustomImageViewComponentData
    private(set) var wrapperInfoData: WrapperInfoComponentData
    private(set) var priceContainerData: PriceContainerData
    
    init(imageData: CustomImageViewComponentData, wrapperInfoData: WrapperInfoComponentData, priceContainerData: PriceContainerData) {
        self.imageData = imageData
        self.wrapperInfoData = wrapperInfoData
        self.priceContainerData = priceContainerData
    }
    
}
