//
//  ItemProviderProtocol.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import Foundation

protocol ItemProviderProtocol: AnyObject {
    
    func askNumberOfItem(in section: Int) -> Int
    func askData(at index: Int) -> GenericDataProtocol?
    func selectedItem(at index: Int)
    func getMoreData()
    func isLoadingCell(for index: Int) -> Bool
    func isDataEmpty(in section: Int) -> Bool
}

extension ItemProviderProtocol {
    func selectedItem(at index: Int) { }
    func getMoreData() { }
    func isLoadingCell(for index: Int) -> Bool { return false }
    func isDataEmpty(in section: Int) -> Bool { return true }
}
