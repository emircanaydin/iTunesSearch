//
//  PurchaseButton.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import UIKit

class PurchaseButton: GenericBaseView<PurchaseButtonData> {
    
    private lazy var shadowContainer: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.4
        temp.layer.cornerRadius = 6
        return temp
    }()
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 10
        temp.clipsToBounds = true
        temp.backgroundColor = ColorHelper.purchaseGreen.value
        return temp
    }()
    
    private lazy var buttonLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = UIFont.systemFont(ofSize: 15, weight: .regular)
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
    
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
        addTapGesture()
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        buttonLabel.text = "Purchase ₺\(data.price)"
    }
    
    // MARK: - Private Functions
    private func addComponents() {
        addSubview(shadowContainer)
        shadowContainer.addSubview(containerView)
        containerView.addSubview(buttonLabel)
        
        NSLayoutConstraint.activate([
            
            shadowContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            shadowContainer.topAnchor.constraint(equalTo: topAnchor),
            shadowContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: shadowContainer.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowContainer.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: shadowContainer.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowContainer.bottomAnchor),
            
            buttonLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            buttonLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
        ])
        
    }
}

// MARK: - UIGestureRecognizerDelegate
extension PurchaseButton: UIGestureRecognizerDelegate {
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: .buttonTappedSelector)
        tap.delegate = self
        addGestureRecognizer(tap)
    }
    
    @objc fileprivate func buttonTapped(_ sender: UITapGestureRecognizer) {
        isUserInteractionEnabled = false
        startTappedAnimation { finish in
            if finish {
                self.isUserInteractionEnabled = true
            }
        }
    }
    
}

fileprivate extension Selector {
    static let buttonTappedSelector = #selector(PurchaseButton.buttonTapped)
}
