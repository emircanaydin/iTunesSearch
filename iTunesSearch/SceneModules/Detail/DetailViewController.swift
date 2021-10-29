//
//  DetailViewController.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import UIKit

class DetailViewController: BaseViewController<DetailViewModel> {
    
    private var detailViewComponent: DetailViewComponent!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        view.backgroundColor = ColorHelper.viewBackground.value
        
        addComponents()
        addViewStateListener()
    }
    
    private func addComponents() {
        detailViewComponent = DetailViewComponent()
        detailViewComponent.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(detailViewComponent)
        
        NSLayoutConstraint.activate([
            detailViewComponent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            detailViewComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailViewComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailViewComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func addViewStateListener() {
        viewModel.subscribeViewState { [weak self] state in
            switch state {
            case .failure, .loading:
                break
            case .done:
                DispatchQueue.main.async {
                    self?.detailViewComponent.setData(by: self?.viewModel.getDetailViewData())
                }
            }
        }
    }
}
