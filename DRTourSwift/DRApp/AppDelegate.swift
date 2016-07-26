//
//  AppDelegate.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/20.
//  
//

/*!
 *  感谢关注和使用、有任何问题可以
 
    asiosldh@163.com
 || QQ 2244784466
 || https://github.com/asiosldh/DraedSwift
 || http://www.jianshu.com/users/8cd6042f01e8/latest_articles

 *  求 star ❤️
 */

/// 设备屏幕bounds
let kScreenBounds = UIScreen.mainScreen().bounds
/// 设备屏幕size
let kScreenSize   = UIScreen.mainScreen().bounds.size
/// 设备屏幕width
let kScreenWidth  = UIScreen.mainScreen().bounds.size.width
/// 设备屏幕height
let kScreenHeight = UIScreen.mainScreen().bounds.size.height

/// 状态栏高度
let kStatusBarHeight     = 20.0
/// 导航条高度
let kNavigationBarHeight = 44.0
/// 工具条高度
let kToolBarHeight       = 40.0
/// 标签条高度
let kTabBarHeight        = 49.0

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        // 创建 window
        self.setWindow()

        // 设置 root vc 控制器
        self.window?.rootViewController = DRTabBarController()
        
        return true
    }

    /*!
     创建 window
     */
    private func setWindow() -> () {
        self.window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.whiteColor()
        self.window?.makeKeyAndVisible()
    }
}
