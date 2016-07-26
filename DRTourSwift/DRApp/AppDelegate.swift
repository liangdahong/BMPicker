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
