//
//  PriceContainer.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import UIKit

class PriceContainer: GenericBaseView<PriceContainerData> {
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 8
        temp.backgroundColor = ColorHelper.priceContainerBackgorund.value
        temp.heightAnchor.constraint(equalToConstant: 20).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return temp
    }()
    
    private lazy var priceLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        temp.text = " "
        temp.contentMode = .center
        temp.textAlignment = .center
        temp.textColor = .white
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
        
        if data.trackPrice == 0 {
            priceLabel.text = "FREE"
            return
        }
        
        priceLabel.text = "₺\(data.trackPrice)"
    }
    
    // MARK: - Private Functions
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
        
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            priceLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            priceLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ])
    }
}
