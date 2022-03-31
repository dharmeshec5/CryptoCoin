//
//  AppDelegate.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import UIKit
import CryptoCoin

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Variable
    
    var window: UIWindow?
    
    // MARK: - Function
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: CoinListConfigurator().makeViewController())
        window?.makeKeyAndVisible()
        return true
    }
    
}
