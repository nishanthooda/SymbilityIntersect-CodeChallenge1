//
//  CoinsViewModel.swift
//  SymbilityIntersect-CodeChallenge1
//
//  Created by Nishant Hooda on 2018-10-08.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import Foundation

struct Coin
{
    let name: String
    let code: String
    let imagePath: String
    var fav: Bool
}

class CoinsViewModel
{
    var favCoins:[String] = []
    var normalCoins:[String] = []
    var coins:[String:Coin] = [:]
    
    func fetchCoinList(completion: @escaping (Bool) -> Void)
    {
        _ = SymbilityRequest.shared.getRequest(urlString: CoinsConstant.dataURL, callback: { (data, error) in
            
            guard error == nil else
            {
                completion(false)
                return
            }
            
            guard let responseData = data else
            {
                completion(false)
                return
            }
            
            do
            {
                guard let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String:AnyObject] else { return }
                
                self.parseCoinList(from: json)
                completion(true)
            }
            catch
            {
                completion(false)
                print("ERROR: Unable convert to JSON")
            }
        })
    }
    
    func parseCoinList(from json: [String : AnyObject])
    {
        for item in json
        {
            if item.key == CoinsConstant.JSONKeys.data
            {
                guard let coinsList = item.value as? [String : AnyObject] else { return }
                
                for coin in coinsList
                {
                    guard let coinInfo = coin.value as? [String : AnyObject] else { continue }
                    
                    guard let name = coinInfo[CoinsConstant.JSONKeys.coinName] as? String else { continue }
                    guard let code = coinInfo[CoinsConstant.JSONKeys.name] as? String else { continue }
                    guard let imagePath = coinInfo[CoinsConstant.JSONKeys.imageURL] as? String else { continue }
                    
                    self.coins.updateValue(Coin(name: name, code: code, imagePath: imagePath, fav: false), forKey: code)
                    self.normalCoins.append(code)
                }
            }
        }
    }
    
    func numOfRow(in section: Int) -> Int
    {
        if self.favCoins.isEmpty
        {
            return self.normalCoins.count
        }
        else
        {
            return section == 0 ? self.favCoins.count : self.normalCoins.count
        }
    }
    
    func addToFavorites(from index: Int)
    {
        let code = self.normalCoins[index]
        self.favCoins.append(code)
        self.normalCoins.remove(at: index)
        self.coins[code]?.fav = true
    }
    
    func removeFromFavorites(from index: Int)
    {
        let code = self.favCoins[index]
        self.normalCoins.append(code)
        self.favCoins.remove(at: index)
        self.coins[code]?.fav = false
    }
}
