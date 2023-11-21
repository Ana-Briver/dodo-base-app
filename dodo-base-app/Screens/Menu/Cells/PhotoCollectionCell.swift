//
//  PhotoCollectionCell.swift
//  dodo-app
//
//  Created by Anastasia on 04.09.23.
//

import Foundation
import UIKit

class PhotoCollectionCell: UICollectionViewCell {
    static let reuseId = "PhotoCollectionCell"
    
    private var containerView: UIView = {
        $0.applyShadow(cornerRadius: 20, shadowRadius: 7.0)
        $0.backgroundColor = .white
        
        return $0
    }(UIView())
    
    var photoImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "cheese")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        imageView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 55).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Cheese"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "2$"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    var checkIcon: UIImageView = {
        var checkIcon = UIImageView()
        checkIcon.image = UIImage(systemName: "checkmark.circle")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        checkIcon.isHidden = true
        
        return checkIcon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    
    func setupView() {
        contentView.addSubview(containerView)
        [photoImageView, nameLabel, priceLabel, checkIcon].forEach {
            containerView.addSubview($0)
        }
    }
    
    func setupConstrains() {
        containerView.snp.makeConstraints { make in
            make.left.right.equalTo(contentView)
            make.top.bottom.equalTo(contentView)
        }
        
        checkIcon.snp.makeConstraints{ make in
            make.top.equalTo(containerView).offset(8)
            make.right.equalTo(containerView).inset(8)
        }
        
        photoImageView.snp.makeConstraints{ make in
            make.top.equalTo(containerView).offset(20)
            make.left.right.equalTo(containerView)
        }
        
        nameLabel.snp.makeConstraints{ make in
            make.top.equalTo(photoImageView.snp.bottom).offset(16)
            make.left.right.equalTo(containerView)
        }
        
        priceLabel.snp.makeConstraints{ make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.left.right.equalTo(containerView)
        }
    }
    
    func update(_ ingredient: Ingredient) {
        nameLabel.text = ingredient.name
        priceLabel.text = ingredient.priceTitle
        photoImageView.image = UIImage(named: ingredient.image)
    }
}
