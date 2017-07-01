//
//  AppDelegate.swift
//  ThreadDemo
//
//  Created by Pavel Gnatyuk on 01/07/2017.
//  Copyright © 2017 Pavel Gnatyuk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        return true
    }
}
