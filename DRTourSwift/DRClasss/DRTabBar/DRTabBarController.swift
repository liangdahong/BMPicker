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
        self.addViewControllerWithViewController(DRAliCloudVC(), title: "阿里云", imageName: "UserHeaderButtonFavoritesSelected.png");
        self.addViewControllerWithViewController(DRConsoleVC(),title: "控制台", imageName: "UserHeaderButtonFavoritesSelected.png");
        self.addViewControllerWithViewController(DRCloudCacheVC(),title: "云栖", imageName: "UserHeaderButtonFavoritesSelected.png");
        self.addViewControllerWithViewController(DRPersonVC(),title: "我的", imageName: "UserHeaderButtonFavoritesSelected.png");
    }

    private func initUI() -> () {
        self.tabBar.hidden = false;
        self.tabBar.translucent = false;
    }
}

// MARK: - UITabBarController extension
extension UITabBarController {
    
    private func addViewControllerWithViewController(vc: UIViewController, title: String, imageName: String) -> () {
        
        vc.title = title;
        
        let nc = UINavigationController.init(rootViewController: vc);
        nc.tabBarItem.image = UIImage.init(named: imageName)
        nc.navigationBar.barTintColor = UIColor.init(colorLiteralRed: 22/255.0, green: 131/255.0, blue: 235/255.0, alpha: 1)
        nc.tabBarItem = UITabBarItem.init(title: title, image: nil, tag: 1);
        nc.title = title;
        nc.tabBarItem.image = UIImage.init(named: imageName);
        let arr = NSMutableArray();
        if self.viewControllers?.count > 0 {
            arr.addObjectsFromArray(self.viewControllers!);
        }
        nc.navigationBar.hidden = false;
        nc.navigationBar.translucent = false;
        arr.addObject(nc);
        self.viewControllers = arr as NSArray as? [UIViewController];
    }
}