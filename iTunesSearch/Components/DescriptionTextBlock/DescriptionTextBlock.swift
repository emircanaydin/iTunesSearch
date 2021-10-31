//
//  DescriptionTextBlock.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import UIKit

class DescriptionTextBlock: GenericBaseView<DescriptionData> {
    
    private lazy var descriptionLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = ColorHelper.segmentedTextColor.value
        temp.text = " "
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.textAlignment = .left
        temp.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return temp
    }()
    
    // MARK: - Override Methods
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addDescription()
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        
        DispatchQueue.main.async {
            self.descriptionLabel.text = data.description
        }
    }
    
    // MARK: - Private Methods
    private func addDescription() {
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
}
