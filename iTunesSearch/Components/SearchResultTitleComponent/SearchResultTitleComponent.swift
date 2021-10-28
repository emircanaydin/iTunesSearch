//
//  SearchResultTitleComponent.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 28.10.2021.
//

import UIKit

class SearchResultTitleComponent: GenericBaseView<SearchResultTitleData> {
    
    private lazy var titleLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = ColorHelper.segmentedTextColor.value
        temp.text = " "
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.textAlignment = .center
        temp.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return temp
    }()
    
    // MARK: - Override Methods
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addLabelComponent()
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        
        DispatchQueue.main.async {
            self.titleLabel.text = "Search results for '\(data.searchTerm)'"
        }
    }
    
    // MARK: - Private Methods
    private func addLabelComponent() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
}
