//
//  GenericBaseView.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import UIKit

class GenericBaseView<T>: BaseView {
    
    private var data: T?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadDataView()
    }
    
    init(frame: CGRect = .zero, data: T? = nil) {
        self.data = data
        super.init(frame: frame)
        loadDataView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadDataView() { }
    
    func setData(by value: T?) {
        self.data = value
        loadDataView()
    }
    
    func returnData() -> T? {
        return data
    }
}
