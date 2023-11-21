//
//  MenuTabVC.swift
//  dodo-app
//
//  Created by Anastasia on 20.09.23.
//

import UIKit

class MainTabVC: UITabBarController {
    private var menuVC: MenuScreenVC = {
        let controller = MenuScreenVC()
        let image = UIImage(systemName: "menucard")
        let selectedImage = UIImage(systemName: "menucard.fill")
        let tabItem = UITabBarItem.init(title: "Menu", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem
        
        return controller
    }()
    
    private var detailVC: DetailScreenVC = {
        let controller = DetailScreenVC()
        let image = UIImage(systemName: "cart")
        let selectedImage = UIImage(systemName: "cart.fill")
        let tabItem = UITabBarItem(title: "Cart", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem
        
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        tabBar.tintColor = .orange
        viewControllers = [menuVC, detailVC]
    }
}
