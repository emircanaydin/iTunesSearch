//
//  ColorHelper.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import Foundation
import UIKit

enum ColorHelper: GenericValueProtocol {
    
    typealias Value = UIColor
    
    var value: UIColor {
        switch self {
        case .priceContainerBackgorund:
            return #colorLiteral(red: 0.7254901961, green: 0.6784313725, blue: 0.5098039216, alpha: 1)
        }
    }
    
    case priceContainerBackgorund
}
