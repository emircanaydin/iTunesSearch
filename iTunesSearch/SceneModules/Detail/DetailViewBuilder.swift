//
//  DetailViewBuilder.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 29.10.2021.
//

import UIKit

class DetailViewBuilder {
    
    class func build(with data: LookupRequest) -> UIViewController {
        let formatter = DetailViewDataFormatter()
        let operationManager = LookupOperationManager()
        let lottieManager = LottieManager()
        let viewModel = DetailViewModel(lookupRequest: data, formatter: formatter, operationManager: operationManager, lottieManager: lottieManager)
        return DetailViewController(viewModel: viewModel)
    }
}
