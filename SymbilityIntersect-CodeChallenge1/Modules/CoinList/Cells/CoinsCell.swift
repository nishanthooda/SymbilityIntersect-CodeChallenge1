//
//  CoinsCell.swift
//  SymbilityIntersect-CodeChallenge1
//
//  Created by Nishant Hooda on 2018-10-08.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import Foundation
import UIKit

class CoinsCell: UITableViewCell
{
    static let identifer = "CoinsCell"
    private let arrowImageHeight: CGFloat = 25
    private let coinImageHeight:CGFloat = 30
    
    let coinImage = CoinImageView()
    let starImage = UIImageView()
    lazy var priceLabel = UITableViewCell.generateCoinPriceLabel(font: SymbilityTheme.font.s, color: SymbilityTheme.color.text, text: CoinsConstant.defaultPriceText)
    lazy var titleLabel = UITableViewCell.generateLabel(font: SymbilityTheme.font.m.bold(), color: SymbilityTheme.color.text, text: "")
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI()
    {
        self.coinImage.translatesAutoresizingMaskIntoConstraints = false
        self.coinImage.clipsToBounds = true
        self.coinImage.layer.cornerRadius = self.coinImageHeight / 2
        
        self.contentView.addSubview(self.coinImage)
        self.coinImage.heightAnchor.constraint(equalToConstant: self.coinImageHeight).isActive = true
        self.coinImage.widthAnchor.constraint(equalToConstant: self.coinImageHeight).isActive = true
        self.coinImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.coinImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: SymbilityTheme.Spacing.s).isActive = true
        
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: SymbilityTheme.Spacing.m).isActive = true
        self.titleLabel.leftAnchor.constraint(equalTo: coinImage.rightAnchor, constant: SymbilityTheme.Spacing.s).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -SymbilityTheme.Spacing.m).isActive = true
        
        self.contentView.addSubview(self.priceLabel)
        self.priceLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: SymbilityTheme.Spacing.xxs).isActive = true
        self.priceLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -SymbilityTheme.Spacing.m).isActive = true
        self.priceLabel.leftAnchor.constraint(equalTo: coinImage.rightAnchor, constant: SymbilityTheme.Spacing.s).isActive = true
        self.priceLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -SymbilityTheme.Spacing.m).isActive = true
        
        self.starImage.translatesAutoresizingMaskIntoConstraints = false
        self.starImage.image = UIImage(named: "starBorder")!.withRenderingMode(.alwaysTemplate)
        self.starImage.tintColor = SymbilityTheme.color.star
        
        self.contentView.addSubview(self.starImage)
        self.starImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -SymbilityTheme.Spacing.s).isActive = true
        self.starImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.starImage.heightAnchor.constraint(equalToConstant: self.arrowImageHeight).isActive = true
        self.starImage.widthAnchor.constraint(equalToConstant: self.arrowImageHeight).isActive = true
    }
}

extension UITableViewCell
{
    static func generateLabel(font: UIFont, color: UIColor, text: String) -> UILabel
    {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = font
        label.text = text
        label.textColor = color
        
        return label
    }
    
    static func generateCoinPriceLabel(font: UIFont, color: UIColor, text: String) -> CoinPriceLabel
    {
        let label = CoinPriceLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = font
        label.textColor = color
        label.text = text
        
        return label
    }
}
