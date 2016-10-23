//
//  AppDelegate.swift
//  TrelloJobApplication
//
//  Created by Vui Nguyen on 2/28/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Setup our root view controller by injecting the view model dependency.
        if let rootController = window?.rootViewController,
           let hashController = rootController as? ReverseHashViewController {
            hashController.viewModel = ReverseHashViewModel()
        }
        
        return true
    }
}

