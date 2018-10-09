//
//  ViewController.swift
//  SymbilityIntersect-CodeChallenge1
//
//  Created by Nishant Hooda on 2018-10-08.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import UIKit

class CoinsController: UIViewController
{
    let viewModel = CoinsViewModel()
    
    private lazy var tableView: UITableView = {
        let tableview = UITableView(frame: CGRect.zero, style: .plain)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.dataSource = self
        tableview.delegate = self
        tableview.backgroundColor = .clear
        tableview.estimatedRowHeight = CoinsConstant.estimatedRowHeight
        return tableview
    }()

    init()
    {
        super.init(nibName: nil, bundle: nil)
        
        self.tableView.register(CoinsCell.self, forCellReuseIdentifier: CoinsCell.identifer)
        self.tableView.register(CoinsHeaderCell.self, forHeaderFooterViewReuseIdentifier: CoinsHeaderCell.identifer)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.viewModel.fetchCoinList { (success) in
            if success
            {
                DispatchQueue.main.async {
                    self.setupUI()
                    self.tableView.reloadData()
                }
            }
            else
            {
                //setup failed request UI
            }
        }
    }
    
    func setupUI()
    {
        self.view.backgroundColor = .white
        self.navigationItem.titleView = NavTitleView(title: CoinsConstant.title)
        
        self.view.addSubview(self.tableView)
        
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
}

extension CoinsController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return self.viewModel.favCoins.isEmpty ? 1 : 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.viewModel.numOfRow(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinsCell.identifer, for: indexPath) as? CoinsCell else { return UITableViewCell() }
        
        var code = ""
        
        if self.viewModel.favCoins.isEmpty
        {
            code = self.viewModel.normalCoins[indexPath.row]
            cell.starImage.image = UIImage(named: "starBorder")!.withRenderingMode(.alwaysTemplate)
        }
        else
        {
            if indexPath.section == 0
            {
                code = self.viewModel.favCoins[indexPath.row]
                cell.starImage.image = UIImage(named: "starFilled")!.withRenderingMode(.alwaysTemplate)
            }
            else
            {
                code = self.viewModel.normalCoins[indexPath.row]
                cell.starImage.image = UIImage(named: "starBorder")!.withRenderingMode(.alwaysTemplate)
            }
        }
        
        let coin = self.viewModel.coins[code]
        
        cell.titleLabel.text = coin?.name
        cell.priceLabel.loadPrice(for: code)
        
        if let imagePath = coin?.imagePath
        {
            cell.coinImage.loadImage(withURL: CoinsConstant.baseURL + imagePath)
        }

        return cell
    }
}

extension CoinsController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if self.viewModel.favCoins.isEmpty
        {
            self.viewModel.addToFavorites(from: indexPath.row)
        }
        else
        {
            if indexPath.section == 0
            {
                self.viewModel.removeFromFavorites(from: indexPath.row)
            }
            else
            {
                self.viewModel.addToFavorites(from: indexPath.row)
            }
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CoinsHeaderCell.identifer) as? CoinsHeaderCell else { return UITableViewHeaderFooterView() }
        
        if self.viewModel.favCoins.isEmpty
        {
            header.titleLabel.text = CoinsConstant.Header.coins
        }
        else
        {
            if section == 0
            {
                header.titleLabel.text = CoinsConstant.Header.fav
            }
            else
            {
                header.titleLabel.text = CoinsConstant.Header.coins
            }
        }
        
        return header
    }
}
