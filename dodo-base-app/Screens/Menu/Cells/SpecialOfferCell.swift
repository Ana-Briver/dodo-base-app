//
//  SpecialCell.swift
//  dodo-app
//
//  Created by Anastasia on 20.09.23.
//

import UIKit

class SpecialOfferCell: UITableViewCell {
    static let reuseId = "SpecialOfferCell"
    
    var containerView: UIView = {
        var container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = true
        
        return container
    }()
    
    var subContentView: UIView = {
        var container = UIView()
        
        container.translatesAutoresizingMaskIntoConstraints = true
        container.backgroundColor = .white
        container.applyShadow(cornerRadius: 16)
        
        return container
    }()
    
    var mainVerticalStack: UIStackView = {
        var stackView = UIStackView.init()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true //what is it
        
        return stackView
    }()
    
    var verticalStack: UIStackView = {
        var stackView = UIStackView.init()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 8)
        stackView.spacing = 8
        return stackView
    }()
    
    var buttonVerticalStack: UIStackView = {
        var stackView = UIStackView.init()
        stackView.axis = .vertical
        stackView.alignment = .trailing
        
        return stackView
    }()
    
    var photoImage: UIImageView = {
        var imageView = UIImageView()
        var width = UIScreen.main.bounds.width
        imageView.image = UIImage(named: "pizza")
        imageView.contentMode = .scaleToFill
        imageView.heightAnchor.constraint(equalToConstant: width * 0.6).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: width * 0.6).isActive = true
        
        return imageView
    }()
    
    var nameLabel: UILabel = {
        var nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        return nameLabel
    }()
    
    var detailLabel: UILabel = {
        var detailLabel = UILabel()
        detailLabel.textColor = .darkGray
        detailLabel.numberOfLines = 0
        detailLabel.lineBreakMode = .byWordWrapping
        detailLabel.font = UIFont.systemFont(ofSize: 16)
        
        return detailLabel
    }()
    
    var priceButton: UIButton = {
        var priceButton = UIButton()
        priceButton.backgroundColor = .orange.withAlphaComponent(0.1)
        priceButton.setTitleColor(.brown, for: .normal)
        priceButton.layer.cornerRadius = 16
        
        let screenWidth = UIScreen.main.bounds.width
        
        return priceButton
    }()
    
    var specialOfferButton: UIButton = {
        let margin: CGFloat = 10.0
        var button = UIButton()
        
        button.setTitle("New", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 16
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStyle() {
        self.selectionStyle = .none
    }
    
    func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(mainVerticalStack)
        
        mainVerticalStack.addSubview(subContentView)
        subContentView.addSubview(verticalStack)
        buttonVerticalStack.addArrangedSubview(priceButton)
        
        [nameLabel, detailLabel].forEach {
            verticalStack.addArrangedSubview($0) //why arranged and not subView
        }
        
        subContentView.addSubview(buttonVerticalStack)
        mainVerticalStack.addArrangedSubview(photoImage)
        mainVerticalStack.addSubview(specialOfferButton)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(8)
            make.left.right.equalTo(contentView).inset(16)
        }
        
        mainVerticalStack.snp.makeConstraints { make in
            make.right.left.equalTo(containerView).inset(8)
            make.top.equalTo(containerView).inset(32)
        }
       
        specialOfferButton.snp.makeConstraints { make in
            make.top.equalTo(containerView).inset(32)
        }
        subContentView.snp.makeConstraints { make in
            make.top.equalTo(mainVerticalStack).inset(100)
            make.right.left.equalTo(mainVerticalStack).inset(8)
        }
        
        verticalStack.snp.makeConstraints { make in
            make.right.left.equalTo(subContentView).inset(8)
            make.top.equalTo(photoImage.snp.bottom).offset(24)
        }
        
        buttonVerticalStack.snp.makeConstraints { make in
            make.top.equalTo(verticalStack.snp.bottom).offset(8)
        }
        
        NSLayoutConstraint.activate([ buttonVerticalStack.trailingAnchor.constraint(equalTo:     verticalStack.trailingAnchor, constant: -8),
                                      specialOfferButton.trailingAnchor.constraint(equalTo:     containerView.trailingAnchor, constant: -32),
            subContentView.bottomAnchor.constraint(equalTo: buttonVerticalStack.bottomAnchor, constant: 16),
            containerView.bottomAnchor.constraint(equalTo: subContentView.bottomAnchor, constant: 16)
        ])
    }
    
    func update(_ product: Product) {
        nameLabel.text = product.name
        photoImage.image = UIImage(named: product.image)
        detailLabel.text = product.detail
        
        priceButton.setTitle(product.priceTitle, for: .normal)
        updateAdaptableButton(product.priceTitle, button: priceButton)
        
        specialOfferButton.setTitle("\(product.specialOffer ?? "Wow")", for: .normal)
        updateAdaptableButton(product.specialOffer, button: specialOfferButton)
    }
    
    func updateAdaptableButton(_ title: String?, button: UIButton) {
        guard title != nil else {
            button.isHidden = true
            return
        }
        
        button.applyAdaptableSize(width: 2.0, height: 1.0)
    }
}
