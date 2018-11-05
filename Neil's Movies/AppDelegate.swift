//
//  AppDelegate.swift
//  Neil's Movies
//
//  Created by Neil Skinner on 05/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // get image configuration
        APIConfiguration.shared.getConfiguration()
        return true
    }
}

