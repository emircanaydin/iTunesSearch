//
//  SearchViewState.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import Foundation

typealias SearchViewStateBlock = (SearchViewState) -> Void

enum SearchViewState {
    case loading
    case done
    case failure
}
