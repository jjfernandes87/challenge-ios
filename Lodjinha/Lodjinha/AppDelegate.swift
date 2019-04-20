//
//  AppDelegate.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 20/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabbarRouter: TabbarWireframe?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        preloadXib()
        initWindow()
        initMainRouter()
        
        return true
    }

}

extension AppDelegate {
    func preloadXib() {
        preloadedMasterErrorXib = UINib(nibName: "MasterError", bundle: Bundle.main)
        preloadedLoadingXib = UINib(nibName: "Loading", bundle: Bundle.main)
        preloadedNoInternetXib = UINib(nibName: "NoInternet", bundle: Bundle.main)
        preloadedEmptyDataXib = UINib(nibName: "EmptyData", bundle: Bundle.main)
    }
    
    func initWindow() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
    }
    
    func initMainRouter() {
        self.tabbarRouter = TabbarWireframe(window: window)
        self.tabbarRouter?.launchApp()
    }
}
