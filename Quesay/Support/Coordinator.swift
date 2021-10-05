//
//  Coordinator.swift
//  Quesay
//
//  Created by Marco Shin on 10/3/21.
//

import UIKit

class Coordinator {
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let rootViewController      = createTabbarVC()
        navigationConfiguration()
        tabbarConfiguration()
        window.rootViewController   = rootViewController
        window.makeKeyAndVisible()
    }
    
    private func createTabbarVC() -> UITabBarController {
        let tabbar = UITabBarController()
        
        tabbar.viewControllers = [createFeedVC(), createProfileVC()]
        
        let images  = ["house", "person"]
        let items   = tabbar.tabBar.items!
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
        return tabbar
    }
    
    private func createFeedVC() -> UINavigationController {
        let rootVC                  = FeedViewController()
        rootVC.title                = "Feed"
        let navigationController    = UINavigationController(rootViewController: rootVC)
        return navigationController
    }
    
    private func createProfileVC() -> UIViewController {
        let rootVC      = ProfileViewController()
        rootVC.title    = "Profile"
        return rootVC
    }
    
    private func navigationConfiguration() {
        UINavigationBar.appearance().tintColor          = .systemOrange
        UINavigationBar.appearance().backgroundColor    = UIColor(named: "BackgroundWhite")
    }
    
    private func tabbarConfiguration() {
        UITabBar.appearance().barTintColor              = UIColor(named: "BackgroundWhite")
        UITabBar.appearance().backgroundColor           = UIColor(named: "BackgroundWhite")
        UITabBar.appearance().unselectedItemTintColor   = .black
        UITabBar.appearance().tintColor                 = .systemOrange
        UITabBar.appearance().layer.borderWidth         = 5
        UITabBar.appearance().layer.borderColor         = UIColor.black.cgColor
    }
}
