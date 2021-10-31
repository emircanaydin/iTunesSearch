//
//  WrapperInfoComponent.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import UIKit

class WrapperCardInfoComponent: GenericBaseView<WrapperCardInfoComponentData> {
    
    private lazy var stackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [artistName, trackName, collectionName])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.setCustomSpacing(5, after: artistName)
        temp.setCustomSpacing(3, after: trackName)
        return temp
    }()
    
    private lazy var artistName: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = ColorHelper.gray.value
        temp.text = " "
        temp.lineBreakMode = .byTruncatingTail
        temp.numberOfLines = 1
        temp.contentMode = .left
        temp.textAlignment = .left
        temp.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return temp
    }()
    
    private lazy var trackName: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = ColorHelper.darkGray.value
        temp.text = " "
        temp.lineBreakMode = .byTruncatingTail
        temp.numberOfLines = 1
        temp.contentMode = .left
        temp.textAlignment = .left
        temp.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return temp
    }()
    
    private lazy var collectionName: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = ColorHelper.gray.value
        temp.text = " "
        temp.lineBreakMode = .byTruncatingTail
        temp.numberOfLines = 1
        temp.contentMode = .left
        temp.textAlignment = .left
        temp.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return temp
    }()
    
    // MARK: - Override Functions
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        artistName.text = data.artistName
        trackName.text = data.trackName
        collectionName.text = data.collectionName
    }
    
    // MARK: - Private Functions
    private func addComponents() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
