//
//  TrackInfoComponentData.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import Foundation

class TrackTitleComponentData {
    
    private(set) var titleText: String
    private(set) var subTitleText: String
    
    init(titleText: String, subTitleText: String) {
        self.titleText = titleText
        self.subTitleText = subTitleText
    }
}
