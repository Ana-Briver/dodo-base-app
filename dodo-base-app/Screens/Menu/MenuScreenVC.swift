//
//  ViewController.swift
//  dodo-app
//
//  Created by Anastasia on 11.08.23.
//

import UIKit
import SnapKit

class MenuScreenVC: UIViewController {
    var products: [Product] = []
    
    let productService = ProductsService()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseId)
        tableView.register(SpecialOfferCell.self, forCellReuseIdentifier: SpecialOfferCell.reuseId)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        fetchProducts()
    }
    
    //MARK: - Business Logic
    func fetchProducts() {
        products = productService.fetchProducts()
        tableView.reloadData()
    }
}
extension MenuScreenVC {
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension MenuScreenVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SpecialOfferCell.reuseId, for: indexPath) as! SpecialOfferCell
            let product = products[indexPath.row]
            cell.update(product)
            return cell
        }
       
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell
        let product = products[indexPath.row] // Subtract 1 to account for the special offer cell
        cell.update(product)
            
        return cell
    }
}

extension MenuScreenVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        print(product)
    }
}

