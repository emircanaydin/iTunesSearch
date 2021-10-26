//
//  ItemCollectionCellView.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import UIKit

class ItemCollectionCellView: BaseCollectionViewCell {
    
    private lazy var wrapperCard: WrapperCard = {
        let temp = WrapperCard()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        addWrapperCard()
    }
    
    // MARK: - Private Functions
    private func addWrapperCard() {
        contentView.addSubview(wrapperCard)
        
        NSLayoutConstraint.activate([
            wrapperCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            wrapperCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            wrapperCard.topAnchor.constraint(equalTo: contentView.topAnchor),
            wrapperCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    // MARK: - Public Functions
    func setData(by value: WrapperCardData) {
        wrapperCard.setData(by: value)
    }
}
