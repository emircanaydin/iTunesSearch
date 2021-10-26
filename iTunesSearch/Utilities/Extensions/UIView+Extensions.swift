//
//  UIView+Extensions.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import Foundation
import UIKit

extension UIView {
    
    func startTappedAnimation(with completion: @escaping (Bool) -> Void) {
        
        transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 6.0, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: completion)
        
        self.layoutIfNeeded()
    }
}
