//
//  AppDelegate.swift
//  task11ryavan
//
//  Created by Ravan on 09.09.24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame:  UIScreen.main.bounds)
        let vc = ViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
}
