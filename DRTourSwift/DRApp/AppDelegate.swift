//
//  AppDelegate.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/20.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.setWindow();
        
        self.window?.rootViewController = DRTabBarController();
        
        return true
    }
    private func setWindow() -> () {
        self.window = UIWindow.init(frame: UIScreen.mainScreen().bounds);
        self.window?.backgroundColor = UIColor.whiteColor();
        self.window?.makeKeyAndVisible();
    }    
}


