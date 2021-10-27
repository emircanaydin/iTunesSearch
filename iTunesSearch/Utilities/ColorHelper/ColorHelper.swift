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
        case .gray:
            return #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        case .darkGray:
            return #colorLiteral(red: 0.2823529412, green: 0.2823529412, blue: 0.2823529412, alpha: 1)
        case .viewBackground:
            return #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
        }
    }
    
    case priceContainerBackgorund
    case gray
    case darkGray
    case viewBackground
}
