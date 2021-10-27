//
//  SegmentedControlData.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 27.10.2021.
//

import UIKit

class SegmentedControlData {
    
    private(set) var textColor: UIColor
    private(set) var selectorViewColor: UIColor
    private(set) var selectorTextColor: UIColor
    private(set) var buttonTitles: [String]
    
    init(textColor: UIColor, selectorViewColor: UIColor, selectorTextColor: UIColor, buttonTitles: [String]) {
        self.textColor = textColor
        self.selectorViewColor = selectorViewColor
        self.selectorTextColor = selectorTextColor
        self.buttonTitles = buttonTitles
    }
}
