//
//  CoinPriceLabel.swift
//  SymbilityIntersect-CodeChallenge1
//
//  Created by Nishant Hooda on 2018-10-09.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import Foundation
import UIKit

let priceCache = NSCache<AnyObject, AnyObject>()

class CoinPriceLabel: UILabel
{
    var code: String?
    
    public func loadPrice(for code: String)
    {
        //default text
        DispatchQueue.main.async {
            self.text = CoinsConstant.defaultPriceText
        }
        
        self.code = code
        
        if let priceFromCache = priceCache.object(forKey: code as AnyObject) as? Double
        {
            DispatchQueue.main.async {
                self.text = CoinsConstant.currSymbol + String(priceFromCache)
            }
            return
        }
        
        DispatchQueue.global().async {
            _ = SymbilityRequest.shared.getRequest(urlString: String(format: CoinsConstant.priceURL, code, CoinsConstant.currency), callback: { [weak self] (data, error) in
                guard error == nil else { return }
                
                guard let responseData = data else { return }
                
                do
                {
                    guard let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String:AnyObject] else { return }
                    
                    guard let price = json[CoinsConstant.currency] as? Double else { return }
                    
                    if self?.code == code
                    {
                        DispatchQueue.main.async {
                            self?.text = CoinsConstant.currSymbol + String(price)
                        }
                    }

                    priceCache.setObject(price as AnyObject, forKey: code as AnyObject)
                }
                catch
                {
                    print("ERROR: Unable convert to JSON")
                    return;
                }
            })
        }
    }
}

