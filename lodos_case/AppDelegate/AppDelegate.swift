//
//  AppDelegate.swift
//  lodos_case
//
//  Created by sercan kaya on 10.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let viewController = SplashViewController()
            let bounds = UIScreen.main.bounds
            self.window = UIWindow(frame: bounds)
            self.window?.makeKeyAndVisible()
            self.window?.rootViewController = viewController
        return true
    }
}
