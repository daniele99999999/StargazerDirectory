//
//  AppDelegate.swift
//  StargazerDirectory
//
//  Created by daniele on 15/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import UIKit
import Common
import Directory

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    var rootCoordinator: CoordinatorProtocol?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navController = UINavigationController()
        self.rootCoordinator = DirectoryCoordinator(rootController: navController, resolver: AppResolver())
        self.rootCoordinator?.start()
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication)
    {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication)
    {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication)
    {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication)
    {
        
    }

    func applicationWillTerminate(_ application: UIApplication)
    {
        
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask
    {
        switch UIDevice.current.userInterfaceIdiom
        {
        case .phone:
            return .portrait
        case .pad:
            return .portrait
        default:
            return .all
        }
    }
}

