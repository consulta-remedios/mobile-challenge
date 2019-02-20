//
//  AppDelegate.swift
//  my-games
//
//  Created by Caio Cardozo on 04/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.isStatusBarHidden = false
        setupNavbar()
        setupRootWindow()
        return true
    }
    
    //Use this function only if the color of the Navigation is fixed.
    // MARK: - Navbar
    func setupNavbar(){
        UINavigationBar.appearance().barTintColor = UIColor.appColor(.main)
        UINavigationBar.appearance().tintColor = UIColor.appColor(.main)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.appColor(.textMainColor) ?? UIColor.white]
    }
    
    // MARK: - RootWindow
    func setupRootWindow(){
        self.window = UIWindow(frame: UIScreen.main.bounds);
        let loginVC : HomeViewController = HomeViewController()
        let nav = UINavigationController(rootViewController: loginVC)
        nav.navigationBar.backgroundColor = UIColor.appColor(.main)
        nav.navigationBar.tintColor = UIColor.appColor(.main)
        nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible();
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

