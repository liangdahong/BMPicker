//
//  DRTabBarController.swift
//  DraedSwift
//
//  Created by Daredos on 16/7/20.
//  Copyright © 2016年 Daredos. All rights reserved.
//

import UIKit

class DRTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化 UITabBarVC
        self.initUI();

        // 设置子控制器
        self.setViewControllers()
    }

    private func setViewControllers() -> () {
        self.addViewControllerWithViewController(DRAliCloudVC(), title: "阿里云");
        self.addViewControllerWithViewController(DRConsoleVC(),title: "控制台");
        self.addViewControllerWithViewController(DRCloudCacheVC(),title: "云栖");
        self.addViewControllerWithViewController(DRPersonVC(),title: "我的");
    }

    private func initUI() -> () {
        self.tabBar.hidden = false;
        self.tabBar.translucent = false;
        self.tabBar.barTintColor = UIColor.blueColor();
    }
}

// MARK: - UITabBarController extension
extension UITabBarController {
    
    private func addViewControllerWithViewController(vc: UIViewController, title: String) -> () {
        let nc = UINavigationController.init(rootViewController: vc);
        let arr = NSMutableArray();
        if self.viewControllers?.count > 0 {
            arr.addObjectsFromArray(self.viewControllers!);
        }
        nc.navigationBar.hidden = false;
        nc.navigationBar.translucent = false;
        arr.addObject(nc);
        vc.title = title;
        nc.navigationBar.barTintColor = UIColor.blueColor();
        nc.tabBarItem = UITabBarItem.init(title: title, image: nil, tag: 1);
        self.viewControllers = arr as NSArray as? [UIViewController];
    }
}