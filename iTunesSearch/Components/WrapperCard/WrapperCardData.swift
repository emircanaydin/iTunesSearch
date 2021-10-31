//
//  WrapperCardData.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import Foundation

class WrapperCardData: GenericDataProtocol {
    
    private(set) var imageData: CustomImageViewComponentData
    private(set) var wrapperInfoData: WrapperCardInfoComponentData
    private(set) var priceContainerData: PriceContainerData
    
    init(imageData: CustomImageViewComponentData, wrapperInfoData: WrapperCardInfoComponentData, priceContainerData: PriceContainerData) {
        self.imageData = imageData
        self.wrapperInfoData = wrapperInfoData
        self.priceContainerData = priceContainerData
    }
    
}
