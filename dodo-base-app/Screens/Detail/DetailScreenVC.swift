//
//  ViewController.swift
//  dodo-app
//
//  Created by Anastasia on 02.09.23.
//

import Foundation
import UIKit

class DetailScreenVC: UIViewController, UICollectionViewDelegate {
    let ingredientsService = IngredientsService()
    var ingredients: [Ingredient] = []
    
    lazy var collectionView: UICollectionView = {
        let itemsCount: CGFloat = 3
        let padding: CGFloat = 8
        let externalPadding: CGFloat = 24
        let paddingCount: CGFloat = itemsCount + 1
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        
        let paddingSize = (paddingCount - 1) * padding + externalPadding * 2
        let cellSize = (UIScreen.main.bounds.width - paddingSize) / itemsCount
        
        layout.sectionInset = UIEdgeInsets(top: padding, left: externalPadding, bottom: padding, right: externalPadding)
        layout.itemSize = CGSize.init(width: cellSize, height: cellSize + 40)
        
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(PhotoCollectionCell.self, forCellWithReuseIdentifier: PhotoCollectionCell.reuseId)
        
        collectionView.allowsMultipleSelection = true
        collectionView.allowsSelection = true
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
        
        fetchIngredients()
    }
    
    func setupViews() {
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    //MARK Business Logic
    func fetchIngredients() {
        ingredients = ingredientsService.fetchIngredients()
        collectionView.reloadData()
    }
}


extension DetailScreenVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionCell.reuseId, for: indexPath) as! PhotoCollectionCell
        
        let ingredient = ingredients[indexPath.row]
        cell.update(ingredient)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! PhotoCollectionCell
        
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        
        cell.layer.borderColor = UIColor.orange.cgColor
        cell.layer.borderWidth = 1.0
        cell.layer.cornerRadius = 16
        cell.checkIcon.isHidden = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! PhotoCollectionCell
        cell.layer.borderWidth = 0.0
        cell.backgroundColor = .white
        cell.checkIcon.isHidden = true
    }
}
