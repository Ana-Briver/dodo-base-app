//
//  UIButton+adaptableSize.swift
//  dodo-app
//
//  Created by Anastasia on 21.09.23.
//

import UIKit

extension UIButton {
    func applyAdaptableSize(width: CGFloat, height: CGFloat, margin: CGFloat? = 10.0) {
        let margin = margin ?? 10.0
        
        self.adjustsImageSizeForAccessibilityContentSizeCategory  = true
        self.widthAnchor.constraint(equalToConstant: self.titleLabel!.intrinsicContentSize.width + margin * width).isActive = true
        self.heightAnchor.constraint(equalToConstant: self.titleLabel!.intrinsicContentSize.height + margin * height).isActive = true
    }
}
