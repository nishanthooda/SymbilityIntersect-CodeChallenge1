//
//  SymbilityTheme.swift
//  SymbilityIntersect-CodeChallenge1
//
//  Created by Nishant Hooda on 2018-10-08.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import Foundation
import UIKit

public struct SymbilityTheme
{
    public struct color
    {
        static let star = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        static let text = #colorLiteral(red: 0.2549019608, green: 0.3098039216, blue: 0.2431372549, alpha: 1)
    }
    
    public struct Spacing
    {
        static let xxxs: CGFloat = 1
        static let xxs: CGFloat = 2
        static let xs: CGFloat = 5
        static let s: CGFloat = 10
        static let m: CGFloat = 15
        static let l: CGFloat = 20
        static let xl: CGFloat = 25
        static let xxl: CGFloat  = 30
        static let xxxl: CGFloat  = 35
        static let xxxxl: CGFloat = 40
    }
    
    public struct font
    {
        static let xs = UIFont(name: "Avenir-Light", size: 10)!
        static let s = UIFont(name: "Avenir-Light", size: 12)!
        static let m = UIFont(name: "Avenir-Light", size: 16)!
        static let l = UIFont(name: "Avenir-Light", size: 20)!
        static let xl = UIFont(name: "Avenir-Light", size: 24)!
        static let xxl = UIFont(name: "Avenir-Light", size: 34)!
        static let xxxl = UIFont(name: "Avenir-Light", size: 44)!
    }
}

extension UIFont
{
    func withTraits(traits: UIFontDescriptorSymbolicTraits) -> UIFont
    {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0)
    }
    
    func bold() -> UIFont
    {
        return withTraits(traits: .traitBold)
    }
}
