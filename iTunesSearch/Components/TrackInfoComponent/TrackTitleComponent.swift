//
//  TrackInfoComponent.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import Foundation
import UIKit

class TrackTitleComponent: GenericBaseView<TrackTitleComponentData> {
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 10
        return temp
    }()
    
    private lazy var titleLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = ColorHelper.selectorColor.value
        temp.text = " "
        temp.contentMode = .center
        temp.textAlignment = .center
        temp.numberOfLines = 0
        temp.lineBreakMode = .byWordWrapping
        temp.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return temp
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = ColorHelper.segmentedTextColor.value
        temp.text = " "
        temp.contentMode = .center
        temp.textAlignment = .center
        temp.numberOfLines = 0
        temp.lineBreakMode = .byWordWrapping
        temp.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return temp
    }()
    
    
    // MARK: Override Functions
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        titleLabel.text = data.titleText
        subTitleLabel.text = data.subTitleText
    }
    
    // MARK: - Private Functions
    private func addComponents() {
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
        
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        
        ])
        
    }
}
