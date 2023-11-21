//
//  UIView+shadow.swift
//  dodo-app
//
//  Created by Anastasia on 13.09.23.
//

import Foundation
import UIKit

extension UIView {
    func applyShadow(cornerRadius: CGFloat, shadowRadius: CGFloat? = 14.0) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        layer.shadowRadius = shadowRadius ?? 14.0
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
