//
//  NavTitleView.swift
//  SymbilityIntersect-CodeChallenge1
//
//  Created by Nishant Hooda on 2018-10-08.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import Foundation
import UIKit

class NavTitleView: UIView
{
    private let cryptoImageWidth: CGFloat = 35
    
    init(title: String)
    {
        super.init(frame: CGRect.zero)
        
        self.setupView(title: title)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(title: String)
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UITableViewCell.generateLabel(font: SymbilityTheme.font.l.bold(), color: SymbilityTheme.color.text, text: title)
        
        let cryptoImage = UIImageView()
        cryptoImage.translatesAutoresizingMaskIntoConstraints = false
        cryptoImage.image = UIImage(named: "cryptoCharts")
        
        self.addSubview(cryptoImage)
        
        cryptoImage.widthAnchor.constraint(equalToConstant: self.cryptoImageWidth).isActive = true
        cryptoImage.topAnchor.constraint(equalTo: self.topAnchor, constant: SymbilityTheme.Spacing.xxs).isActive = true
        cryptoImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -SymbilityTheme.Spacing.xs).isActive = true
        cryptoImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        self.addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: SymbilityTheme.Spacing.xs).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -SymbilityTheme.Spacing.xs).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: cryptoImage.rightAnchor, constant: SymbilityTheme.Spacing.s).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}

