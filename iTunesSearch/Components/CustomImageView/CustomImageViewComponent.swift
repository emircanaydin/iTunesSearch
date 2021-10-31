//
//  CustomImageViewComponent.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import Foundation
import UIKit

class CustomImageViewComponent: UIImageView {
    
    private var imageUrlString: String?
    
    func setData(componentData: CustomImageViewComponentData) {
        DispatchQueue.main.async { [weak self] in
            self?.imageLoadingProcess(componentData: componentData)
        }
        
    }
    
    private func fireImageDownloadingRequest(_ url: URL, _ componentData: CustomImageViewComponentData) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.handleTaskResponse(data: data, componentData: componentData)
            }
            
        }.resume()
    }
    
    private func imageLoadingProcess(componentData: CustomImageViewComponentData) {
        imageUrlString = componentData.imageUrl
        
        image = nil
        
        if let cachedImage = returnImageFromCache(imageUrl: componentData.imageUrl) {
            image = cachedImage
            return
        }
        
        guard let url = URL(string: componentData.imageUrl) else { return }
        
        fireImageDownloadingRequest(url, componentData)
    }
    
    private func handleTaskResponse(data: Data?, imageUrl: String) {
        guard let data = data, let image = UIImage(data: data) else { return }
        
        if self.imageUrlString == imageUrl {
            UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve) { [weak self] in
                self?.image = image
            }
        }
        
        setImageToCache(key: imageUrl, object: image)
        
    }
    
    private func handleTaskResponse(data: Data?, componentData: CustomImageViewComponentData) {
        guard let data = data, let image = UIImage(data: data) else { return }
        
        if self.imageUrlString == componentData.imageUrl {
            UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve) { [weak self] in
                self?.image = image
            }
        }
        
        setImageToCache(key: componentData.imageUrl, object: image)
        
    }
    
    private func returnImageFromCache(imageUrl: String) -> UIImage? {
        guard let cachedImage = ImageCacheManager.returnImagesFromCache(key: imageUrl) else { return nil }
        return cachedImage
    }
    
    private func setImageToCache(key: String, object: UIImage) {
        ImageCacheManager.setImagesToCache(object: object, key: key)
    }
    
    private func loadImageFromDiskWith(componentData: CustomImageViewComponentData) {
        
        imageUrlString = componentData.imageUrl
        
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        
        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(componentData.imageId!)
            if let image = UIImage(contentsOfFile: imageUrl.path) {
                self.image = image
            } else {
                guard let url = URL(string: componentData.imageUrl) else { return }
                fireImageDownloadingRequest(url, componentData)
            }
        } else {
            guard let url = URL(string: componentData.imageUrl) else { return }
            fireImageDownloadingRequest(url, componentData)
        }
        
    }
    
}
