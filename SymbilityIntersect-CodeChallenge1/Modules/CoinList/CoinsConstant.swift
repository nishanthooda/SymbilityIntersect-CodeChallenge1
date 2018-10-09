//
//  CoinsConstant.swift
//  SymbilityIntersect-CodeChallenge1
//
//  Created by Nishant Hooda on 2018-10-08.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import Foundation
import UIKit

struct CoinsConstant
{
    static let baseURL = "https://www.cryptocompare.com"
    static let currency = "CAD"
    static let currSymbol = "$"
    static let dataURL = "https://www.cryptocompare.com/api/data/coinlist/"
    static let defaultPriceText = "$XXX"
    static let estimatedRowHeight: CGFloat = 50
    static let priceURL = "https://min-api.cryptocompare.com/data/price?fsym=%@&tsyms=%@"
    static let title = "Crypto Charts"
    
    struct Header
    {
        static let coins = "Coins"
        static let fav = "Favorites"
    }
    
    struct JSONKeys
    {
        static let coinName = "CoinName"
        static let data = "Data"
        static let imageURL = "ImageUrl"
        static let name = "Name"
    }
}
