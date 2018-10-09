//
//  IntroController.swift
//  SymbilityIntersect-CodeChallenge1
//
//  Created by Nishant Hooda on 2018-10-09.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import UIKit

class IntroController: UIViewController
{
    init()
    {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    func setupUI()
    {
        self.view.backgroundColor = .white
        self.navigationItem.titleView = NavTitleView(title: CoinsConstant.title)
        
        
    }
}
