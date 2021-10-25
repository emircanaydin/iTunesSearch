//
//  BaseView.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addMajorViewComponents()
        setupViewConfigurations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        addMajorViewComponents()
        setupViewConfigurations()

    }
    
    func addMajorViewComponents() { }
    func setupViewConfigurations() { }
}
