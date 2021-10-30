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
                                                                         collectionName: list[index].collectionName ?? list[index].trackName),
                               priceContainerData: PriceContainerData(trackPrice: list[index].trackPrice))
    }
    
    func getItemId(at index: Int) -> Int {
        return list[index].trackId
    }
    
    func clearData() {
        self.paginationInfo.resultCount = 0
        self.paginationInfo.offset = 0
        self.list.removeAll()
    }
    
    func getSearchControllerComponentData(textChangeListener: @escaping TextChangeBlock, cleanListener: @escaping VoidCompletionBlock) -> SearchControllerComponentData {
        return SearchControllerComponentData().setTextChangeListener(by: textChangeListener).setCleanListener(by: cleanListener)
    }
    
    func getSegmentedControllerData(with listener: SegmentedControlProtocol) -> SegmentedControlData {
        return SegmentedControlData(textColor: ColorHelper.segmentedTextColor.value,
                                    selectorViewColor: ColorHelper.selectorColor.value,
                                    selectorTextColor: ColorHelper.selectorColor.value,
                                    buttonTitles: ["Music", "Movie", "App", "Book"],
                                    indexListener: listener)
    }
    
    func getMediaType(with index: Int) -> String {
        switch index {
        case 0:
            return "musicTrack"
        case 1:
            return "movie"
        case 2:
            return "software"
        case 3:
            return "ebook"
        default:
            return "musicTrack"
        }
    }
    
}
