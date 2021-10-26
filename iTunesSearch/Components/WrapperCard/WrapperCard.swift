//
//  WrapperCard.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import UIKit

class WrapperCard: GenericBaseView<GenericDataProtocol> {
    
    private lazy var stackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [imageContainer, wrapperInfo, priceContainer])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.spacing = 10
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        return temp
    }()
    
    private lazy var imageContainer: CustomImageViewComponentContainer = {
        let temp = CustomImageViewComponentContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.heightAnchor.constraint(equalToConstant: 100).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 100).isActive = true
        temp.layer.cornerRadius = 2
        temp.clipsToBounds = true
        return temp
    }()
    
    private lazy var wrapperInfo: WrapperInfoComponent = {
        let temp = WrapperInfoComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var priceContainer: PriceContainer = {
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
        guard let data = returnData() as? WrapperCardData else { return }
        imageContainer.setData(by: data.imageData)
        wrapperInfo.setData(by: data.wrapperInfoData)
        priceContainer.setData(by: data.priceContainerData)
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
