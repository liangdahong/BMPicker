//
//  UIControl+Extension
//  DRTourSwift
//
//  Created by Daredos on 16/7/25.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit

class DRControl: NSObject {
    
    private var block: (() -> ()) = {};
}

public extension UIControl {
    public func addTouchUpInsideWithBlock(block: (() -> ())) -> Void {
        let drControl = DRControl();
        drControl.block = block;
        objc_setAssociatedObject(self, "DRControl", "ldh", .OBJC_ASSOCIATION_RETAIN)
        self.addTarget(self, action: #selector(self.touchUpInside), forControlEvents: .TouchUpInside);
    }

    @objc private func touchUpInside() -> Void {
        let drControl = objc_getAssociatedObject(self, "DRControl");
        
        self.dr_height = 1;
    }
}


