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
        scrollView.addSubview(contentView)
        contentView.addSubview(detailViewComponent)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            detailViewComponent.topAnchor.constraint(equalTo: contentView.topAnchor),
            detailViewComponent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            detailViewComponent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
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
                    print(self?.detailViewComponent.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize))
                }
            }
        }
    }
}
