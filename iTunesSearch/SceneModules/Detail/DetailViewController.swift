//
//  DetailViewController.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import UIKit

class DetailViewController: BaseViewController<DetailViewModel> {
    
    private lazy var detailViewComponent: DetailViewComponent = {
        let temp = DetailViewComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var scrollView: UIScrollView = {
        let temp = UIScrollView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = ColorHelper.viewBackground.value
        temp.autoresizingMask = .flexibleHeight
        return temp
    }()

    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        view.backgroundColor = ColorHelper.viewBackground.value
        
        addComponents()
        addViewStateListener()
    }
    
    private func addComponents() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(detailViewComponent)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            detailViewComponent.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            detailViewComponent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            detailViewComponent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            detailViewComponent.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
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
