//
//  TabbarWireframe.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 20/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

class TabbarWireframe: UITabBarController {
    
    // MARK: - Constants
    var window: UIWindow?
    
    // MARK: - Constructors
    convenience init(window: UIWindow?) {
        self.init()
        self.window = window
        self.window?.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barStyle = .default
        self.tabBar.tintColor = UIColor.purple
    }
    
    func launchApp() {
        self.viewControllers = [homeController(), aboutController()]
        self.window?.rootViewController = self
    }
}

// MARK: - Initialize tabs
extension TabbarWireframe {
    internal func homeController() -> UIViewController {
        let controller = HomeWireframe().view!
        controller.tabBarItem = tabBarItem(tag: 0, title: "Home", icon: "home")
        
        return navigationController(controller)
    }

    internal func aboutController() -> UIViewController {
        let controller = AboutWireframe().view!
        controller.tabBarItem = tabBarItem(tag: 1, title: "Sobre", icon: "tag")
        
        return navigationController(controller)
    }
}

// MARK: - Private methods
extension TabbarWireframe {
    private func tabBarItem(tag: Int, title: String, icon: String) -> UITabBarItem? {
        let tab = UITabBarItem(title: title, image: UIImage(named: "\(icon)Deselected"), selectedImage: UIImage(named: "\(icon)Selected"))
        tab.tag = tag
        return tab
    }
    
    private func navigationController(_ root: UIViewController) -> UINavigationController {
        return NavigationViewController(rootViewController: root)
    }
}
