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
    
    private lazy var contentView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var scrollView: UIScrollView = {
        let temp = UIScrollView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = ColorHelper.viewBackground.value
        temp.showsVerticalScrollIndicator = false
        temp.delaysContentTouches = false
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
        scrollView.addSubview(contentView)
        contentView.addSubview(detailViewComponent)
        
        let contentViewCenterY = contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        contentViewCenterY.priority = .defaultLow

        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),

            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentViewCenterY,
            contentViewHeight,
            
            detailViewComponent.topAnchor.constraint(equalTo: contentView.topAnchor),
            detailViewComponent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            detailViewComponent.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            detailViewComponent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
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
