//
//  DetailViewComponent.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import UIKit

class DetailViewComponent: GenericBaseView<DetailViewComponentData> {
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [trackImage, trackInfo, purchaseButton, descriptionBlock, collectionBorderComponent])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 10
        return temp
    }()
    
    private lazy var trackImage: CustomImageViewComponent = {
        let temp = CustomImageViewComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.heightAnchor.constraint(equalToConstant: 150).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return temp
    }()
    
    private lazy var trackInfo: TrackInfoComponent = {
        let temp = TrackInfoComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var purchaseButton: PurchaseButton = {
        let temp = PurchaseButton()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.widthAnchor.constraint(equalToConstant: 150).isActive = true
        temp.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return temp
    }()
    
    private lazy var descriptionBlock: DescriptionTextBlock = {
        let temp = DescriptionTextBlock()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var collectionBorderComponent: CollectionBorderComponent = {
        let temp = CollectionBorderComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60).isActive = true
        return temp
    }()
    
    // MARK: - Override Methods
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        
        trackImage.setData(componentData: data.imageData)
        trackInfo.setData(by: data.trackInfoData)
        purchaseButton.setData(by: data.purchaseButtonData)
        collectionBorderComponent.setData(by: data.collectionBorderData)
        
        guard data.descriptionData.description != "" else {
            mainStackView.removeArrangedSubview(descriptionBlock)
            return
        }
        
        descriptionBlock.setData(by: data.descriptionData)
        
    }
    
    // MARK: - Private Methods
    private func addComponents() {
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
}
