//
//  SearchViewDataFormatter.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import Foundation

class SearchViewDataFormatter: SearchViewDataFormatterProtocol {
    
    private var componentData: SearchResponse?
    private var list: [Wrapper] = [Wrapper]()
    
    var paginationInfo: PaginationInfo = PaginationInfo()
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        let count = list.count
        return (paginationInfo.limit <= paginationInfo.resultCount) ? count + 1 : count
    }
    
    func getCount() -> Int {
        return list.count
    }
    
    func setData(with response: SearchResponse) {
        self.componentData = response
        self.paginationInfo.resultCount = response.resultCount
        self.list.append(contentsOf: response.results)
    }
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        return WrapperCardData(imageData: CustomImageViewComponentData(imageUrl: list[index].artworkUrl100),
                               wrapperInfoData: WrapperInfoComponentData(artistName: list[index].artistName,
                                                                         trackName: list[index].trackName,
                                                                         collectionName: list[index].collectionName),
                               priceContainerData: PriceContainerData(trackPrice: list[index].trackPrice))
    }
    
    func getItemId(at index: Int) -> Int {
        return list[index].trackID
    }
    
    func getSearchControllerComponentData(with listener: (String?) -> Void) -> SearchControllerComponentData {
        return SearchControllerComponentData().setTextChangeListener(by: listener)
    }
    
}
