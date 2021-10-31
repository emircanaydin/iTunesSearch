//
//  BaseCollectionViewCell.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addMajorViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addMajorViews()
        setupView()
    }
    
    func setupView() {}
    func addMajorViews() {}
    
    static var identifier: String {
        return String(describing: self)
    }
}
