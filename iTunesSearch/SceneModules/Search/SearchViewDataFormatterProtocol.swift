//
//  SearchViewDataFormatterProtocol.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import Foundation

protocol SearchViewDataFormatterProtocol {
    
    var paginationInfo: PaginationInfo { get set }
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getCount() -> Int
    func setData(with response: SearchResponse)
    func getItem(at index: Int) -> GenericDataProtocol?
    func getItemId(at index: Int) -> Int
    func getSearchControllerComponentData(with listener: TextChangeBlock) -> SearchControllerComponentData
}
