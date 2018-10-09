//
//  SymbilityImageView.swift
//  SymbilityIntersect-CodeChallenge1
//
//  Created by Nishant Hooda on 2018-10-08.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class CoinImageView: UIImageView
{
    var imageURLString: String?
    
    public func loadImage(withURL url: String)
    {
        if let defaultImage = UIImage(named: "defaultCoinImage")
        {
            DispatchQueue.main.async {
                self.image = defaultImage
            }
        }
        
        self.imageURLString = url
        
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage
        {
            DispatchQueue.main.async {
                self.image = imageFromCache
            }
            return
        }
        
        DispatchQueue.global().async {
            _ = SymbilityRequest.shared.getRequest(urlString: url, callback: { [weak self] (data, error) in
                guard error == nil else { return }
                
                guard let responseData = data else { return }
                
                guard let imageToCache = UIImage(data: responseData) else { return }
                
                if self?.imageURLString == url
                {
                    DispatchQueue.main.async {
                        self?.image = imageToCache
                    }
                }
                
                imageCache.setObject(imageToCache, forKey: url as AnyObject)
            })
        }
    }
}
