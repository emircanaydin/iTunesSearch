//
//  SearchViewState.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import Foundation

typealias ViewStateBlock = (ViewState) -> Void

enum ViewState {
    case loading
    case done
    case failure
}
