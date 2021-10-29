//
//  TrackInfoComponent.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import Foundation
import UIKit

class TrackInfoComponent: GenericBaseView<TrackInfoComponentData> {
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [artistNameLabel, trackNameLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 10
        return temp
    }()
    
    private lazy var artistNameLabel: UILabel = {
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
    
    private lazy var trackNameLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = ColorHelper.segmentedTextColor.value
        temp.text = " "
        temp.contentMode = .center
        temp.textAlignment = .center
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
        artistNameLabel.text = data.artistName
        trackNameLabel.text = data.trackName
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
