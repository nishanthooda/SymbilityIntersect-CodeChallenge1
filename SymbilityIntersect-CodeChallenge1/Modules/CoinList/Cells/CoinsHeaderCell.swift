//
//  CoinsHeaderCell.swift
//  SymbilityIntersect-CodeChallenge1
//
//  Created by Nishant Hooda on 2018-10-09.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import UIKit

class CoinsHeaderCell: UITableViewHeaderFooterView
{
    static let identifer = "CoinsHeaderCell"
    
    lazy var titleLabel = UITableViewCell.generateLabel(font: SymbilityTheme.font.m.bold(), color: SymbilityTheme.color.text, text: "")
    
    override init(reuseIdentifier: String?)
    {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI()
    {
        self.contentView.addSubview(self.titleLabel)
        
        self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: SymbilityTheme.Spacing.s).isActive = true
        self.titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -SymbilityTheme.Spacing.s).isActive = true
        self.titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: SymbilityTheme.Spacing.m).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -SymbilityTheme.Spacing.m).isActive = true
    }
}
