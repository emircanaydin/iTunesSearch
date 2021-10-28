//
//  AppDelegate.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 25.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow()
        let searchViewController = SearchViewBuilder.build()
        let navigationController = UINavigationController(rootViewController: searchViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

