//
//  AppDelegate.swift
//  CarWash
//
//  Created by Piotr Wesolowski on 30/10/2017.
//  Copyright © 2017 Piotr Wesolowski. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var carListGlobal = CarList.init()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let tabBarController: UITabBarController = self.window?.rootViewController as! UITabBarController
        let tabBar: UITabBar = tabBarController.tabBar
        
        
        let tabBarItem1 = tabBar.items![0]
        tabBarItem1.title = "Pending"
        tabBarItem1.image = UIImage(named: "tabbar_white")?.withRenderingMode(.alwaysOriginal)
        tabBarItem1.selectedImage = UIImage(named: "tabbar_red")?.withRenderingMode(.alwaysOriginal)
        tabBarItem1.titlePositionAdjustment.vertical = tabBarItem1.titlePositionAdjustment.vertical-2
        tabBarItem1.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.white], for: UIControlState.normal)
        tabBarItem1.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.red], for: UIControlState.highlighted)
        
        let tabBarItem2 = tabBar.items![1]
        tabBarItem2.title = "All"
        tabBarItem2.image = UIImage(named: "tabbar_white")?.withRenderingMode(.alwaysOriginal)
        tabBarItem2.selectedImage = UIImage(named: "tabbar_green")?.withRenderingMode(.alwaysOriginal)
        tabBarItem2.titlePositionAdjustment.vertical = tabBarItem2.titlePositionAdjustment.vertical-2
        tabBarItem2.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.white], for: UIControlState.normal)
        tabBarItem2.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.green], for: UIControlState.highlighted)
        
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor .white], for: UIControlState.normal)
//
//        var titleHighlightedColor = UIColor(red: 153/255.0, green: 192/255.0, blue: 48/255.0, alpha: 1.0)
//
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : titleHighlightedColor], for: UIControlState.highlighted)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

