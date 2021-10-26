//
//  SearchControllerComponentData.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import Foundation

typealias TextChangeBlock = (String?) -> Void

class SearchControllerComponentData {
    
    private(set) var textChangeListener: TextChangeBlock?
    
    func setTextChangeListener(by value: @escaping TextChangeBlock) -> Self {
        textChangeListener = value
        return self
    }
}
