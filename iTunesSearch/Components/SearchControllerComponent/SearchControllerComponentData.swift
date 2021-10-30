//
//  SearchControllerComponentData.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import Foundation

typealias TextChangeBlock = (String?) -> Void
typealias VoidCompletionBlock = () -> Void

class SearchControllerComponentData {
    
    private(set) var clearListener: VoidCompletionBlock?
    private(set) var textChangeListener: TextChangeBlock?
    
    func setTextChangeListener(by listener: @escaping TextChangeBlock) -> Self {
        textChangeListener = listener
        return self
    }
    
    func setCleanListener(by listener: @escaping VoidCompletionBlock) -> Self {
        clearListener = listener
        return self
    }
}
