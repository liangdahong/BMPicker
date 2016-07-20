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
        self.setViewControllers()
        self.tabBar.hidden = false;
        self.tabBar.translucent = false;
    }

    private func setViewControllers() -> () {
        self.addViewControllerWithViewController(DRNewsVC(), title: "消息");
        self.addViewControllerWithViewController(DRPersonVC(),title: "个人中心");
    }

    func addViewControllerWithViewController(vc: UIViewController, title: String) -> () {
        let nc = UINavigationController.init(rootViewController: vc);
        let arr = NSMutableArray();
        if self.viewControllers?.count > 0 {
            arr.addObjectsFromArray(self.viewControllers!);
        }
        nc.navigationBar.hidden = false;
        nc.navigationBar.translucent = false;
        arr.addObject(nc);
        vc.title = title;
        nc.tabBarItem = UITabBarItem.init(title: title, image: nil, tag: 1);
        self.viewControllers = arr as NSArray as? [UIViewController];
    }
}
