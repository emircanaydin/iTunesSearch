//
//  DetailViewDataFormatterProtocol.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import Foundation

protocol DetailViewDataFormatterProtocol {
    
    func getDetailViewComponentData() -> DetailViewComponentData
    func setData(with response: SearchResponse)
}
