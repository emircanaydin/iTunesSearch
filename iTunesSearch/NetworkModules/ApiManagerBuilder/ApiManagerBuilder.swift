//
//  ApiManagerBuilder.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 30.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class ApiManagerBuilder {
    
    // ApiManager optionally have ApiCallListener.
    // ApiCallListener have two functions, onPreExecute and onPostExecute
    // If defined ApiCallListener on ApiManager, ApiManager call onPreExecute before making a request.
    // Calls onPostExecute when the request is finished.
    private static let lottieManager = LottieManager()
    private static let listener = ApiCallListenerManager(animationManager: lottieManager)
    private static let manager = APIManager(apiCallListener: listener)
    
    class func build() -> APIManagerInterface {
        return manager
    }
}
