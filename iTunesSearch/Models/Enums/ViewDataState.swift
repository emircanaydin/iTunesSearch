//
//  SearchViewState.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import Foundation

typealias ViewDataStateBlock = (ViewDataState) -> Void

enum ViewDataState {
    case loading
    case newData
    case moreData
    case failure
}
