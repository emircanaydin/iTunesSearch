//
//  CollectionBorderComponent.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import UIKit
import Foundation

class CollectionBorderComponent: GenericBaseView<CollectionBorderData> {
    
    private lazy var containerView: UIView = {
       let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .white
        temp.layer.borderWidth = 1
        temp.layer.borderColor = ColorHelper.borderColor.value.cgColor
        return temp
    }()
    
    private lazy var componentStackView: UIStackView = {
       let temp = UIStackView(arrangedSubviews: [borderTitle, collectionNameLabel, relaseDataLabel, collectionPriceContainer])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .leading
        temp.distribution = .fill
        temp.axis = .vertical
        temp.setCustomSpacing(10, after: borderTitle)
        temp.setCustomSpacing(5, after: collectionNameLabel)
        temp.setCustomSpacing(5, after: relaseDataLabel)
        return temp
    }()
    
    private lazy var borderTitle: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = ColorHelper.borderColor.value
        temp.text = "Collection With"
        temp.contentMode = .left
        temp.textAlignment = .left
        temp.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        return temp
    }()
    
    private lazy var collectionNameLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = ColorHelper.darkGray.value
        temp.text = " "
        temp.contentMode = .left
        temp.textAlignment = .left
        temp.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return temp
    }()
    
    private lazy var relaseDataLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = ColorHelper.borderColor.value
        temp.text = " "
        temp.contentMode = .left
        temp.textAlignment = .left
        temp.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        return temp
    }()
    
    private lazy var collectionPriceContainer: PriceContainer = {
        let temp = PriceContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: - Override Functions
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        self.collectionNameLabel.text = data.collectionName
        self.collectionPriceContainer.setData(by: data.collectionPriceContainerData)
        
        let releaseYear = getReleaseYearFromReleaseData(date: data.releaseDate)
        self.relaseDataLabel.text = "Release Year: \(releaseYear)"
    }
    
    // MARK: - Private Functions
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(componentStackView)
        
        NSLayoutConstraint.activate([
        
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),

            componentStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            componentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            componentStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            componentStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            
        ])
    }
    
    private func getReleaseYearFromReleaseData(date: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss'Z'"
        let releaseData = inputFormatter.date(from: date)
        inputFormatter.dateFormat = "yyyy"
        let resultString = inputFormatter.string(from: releaseData!)
        return resultString
    }
}
