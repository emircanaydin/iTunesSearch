//
//  EmptyResultView.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 28.10.2021.
//

import UIKit

class EmptyResultView: GenericBaseView<EmptyResultViewData> {
        
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [imageContainer, infoLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 20
        return temp
    }()
    
    private lazy var imageContainer: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 5
        temp.clipsToBounds = true
        temp.image = UIImage(named: "data_not_found")
        temp.heightAnchor.constraint(equalToConstant: 200).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return temp
    }()
    
    private lazy var infoLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "No results were found. Please make another call."
        temp.textAlignment = .center
        temp.contentMode = .center
        temp.font = UIFont.systemFont(ofSize: 22)
        temp.numberOfLines = 0
        temp.lineBreakMode = .byWordWrapping
        temp.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 80).isActive = true
        return temp
    }()
    
    func activationManager(by value: Bool) {
        isHidden = !value
    }
    
    // MARK: - Override Methods
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    // MARK: - Private Methods
    private func addComponents() {
        addSubview(mainStackView)
        isHidden = true
        
        NSLayoutConstraint.activate([
        
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        
        ])
    }
    
}
