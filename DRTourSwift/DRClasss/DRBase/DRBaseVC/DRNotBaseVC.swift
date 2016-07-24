//
//  DRNotBaseVC.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/24.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit

class DRNotBaseVC: DRBaseVC {
    
    class func viewController() -> (DRNotBaseVC) {
        let c = DRNotBaseVC()
        c.hidesBottomBarWhenPushed = true;
        return c;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hidesBottomBarWhenPushed = true;
    }
}
