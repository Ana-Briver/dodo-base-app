//
//  ProductCell.swift
//  dodo-app
//
//  Created by Anastasia on 11.08.23.
//

import UIKit
import SnapKit

class ProductCell: UITableViewCell {
    static let reuseId = "ProductCell"
    
    private var containerView: UIView = {
        $0.backgroundColor = .white
        //$0.applyShadow(cornerRadius: 3)
        
        return $0
    }(UIView())
    
    private var verticalStackView: UIStackView = {
        var stackView = UIStackView.init()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .leading
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 16, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        return stackView
    }()
    
    var nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Hawaii"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    var detailLabel: UILabel = {
        var label = UILabel()
        label.text = "Chicken"
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    var priceButton: UIButton = {
        var button = UIButton()
        button.setTitle("Button", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.backgroundColor = .orange.withAlphaComponent(0.1)
        button.layer.cornerRadius = 13
        button.setTitleColor(.brown, for: .normal)
        
        return button
    }()
    
    var productImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "pizza")
        imageView.contentMode = .scaleAspectFill
        
        let width = UIScreen.main.bounds.width
        imageView.heightAnchor.constraint(equalToConstant: 0.3 * width).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 0.3 * width).isActive = true
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupStyles()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }
    
    func setupStyles() {
        self.selectionStyle = .none
    }
    
    func setupViews() {
        contentView.addSubview(containerView)
        
        containerView.addSubview(productImageView)
        containerView.addSubview(verticalStackView)
        
        [nameLabel, detailLabel, priceButton].forEach {
            verticalStackView.addArrangedSubview($0)
        }
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(16)
            make.top.bottom.equalTo(contentView).inset(8)
        }
        
        productImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.centerY.equalTo(containerView)
        }

        verticalStackView.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(containerView).inset(10)
            make.left.equalTo(productImageView.snp.right).offset(10)
        }
    }
    
    func update(_ product: Product) {
        nameLabel.text = product.name
        detailLabel.text = product.detail
        priceButton.setTitle(product.priceTitle, for: .normal)
        updateAdaptableButton(product.priceTitle, button: priceButton)
        
        productImageView.image = UIImage(named: product.image)
    }
    
    func updateAdaptableButton(_ title: String?, button: UIButton) {
        guard title != nil else {
            button.isHidden = true
            return
        }
        
        button.applyAdaptableSize(width: 3.5, height: 1.0)
    }
}
