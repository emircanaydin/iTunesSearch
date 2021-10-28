//
//  EmptyResultView.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 28.10.2021.
//

import UIKit

class EmptyResultView: GenericBaseView<EmptyResultViewData> {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [imageContainer])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .fill
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
        temp.heightAnchor.constraint(equalToConstant: 300).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 300).isActive = true
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
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
        
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            mainStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        
        ])
    }
    
}
