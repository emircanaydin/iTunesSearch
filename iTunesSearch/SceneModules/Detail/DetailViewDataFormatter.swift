//
//  DetailViewDataFormatter.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import Foundation

class DetailViewDataFormatter: DetailViewDataFormatterProtocol {
    
    private var trackData: Wrapper?
    
    func getDetailViewComponentData() -> DetailViewComponentData {
        return DetailViewComponentData(imageData: CustomImageViewComponentData(imageUrl: trackData?.artworkUrl100 ?? ""),
                                       trackInfoData: TrackTitleComponentData(titleText: trackData?.trackName  ?? "", subTitleText: trackData?.artistName ?? ""),
                                       purchaseButtonData: PurchaseButtonData(price: trackData?.trackPrice ?? 0),
                                       descriptionData: DescriptionTextComponentData(description: trackData?.description ?? ""),
                                       collectionContainerData: CollectionContainerComponentData(collectionName: (trackData?.collectionName ?? trackData?.trackName) ?? "", releaseDate: trackData?.releaseDate, collectionPriceContainerData: PriceContainerData(trackPrice: trackData?.collectionPrice ?? trackData?.trackPrice)))
    }
    
    func setData(with response: SearchResponse?) {
        
        guard let response = response, response.resultCount > 0 else { return }
        
        trackData = response.results[0]
    }
    
    
}
