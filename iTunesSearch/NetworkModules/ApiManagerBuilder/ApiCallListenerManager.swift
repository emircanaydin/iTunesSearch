//
//  ApiCallListenerManager.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 30.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class ApiCallListenerManager: ApiCallListener {
   
    private let animationManager: LottieManagerProtocol
    
    init(animationManager: LottieManagerProtocol) {
        self.animationManager = animationManager
    }
    
    func onPreExecute() {
        animationManager.onPreExecute()
    }
    
    func onPostExecute() {
        animationManager.onPostExecute()
    }
}
