//
//  UIControl+Extension
//  DRTourSwift
//
//  Created by Daredos on 16/7/25.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit

typealias sendValueClosure=(string:String)->Void

public extension UIControl {

    public func addEventsWithControlEvents(controlEvents: UIControlEvents, block: (() -> ())) -> Void {
        
    }

}


//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    // 把@YES 通过 key为:kRuntimeKey  与 self 绑定起来
//    objc_setAssociatedObject(self, kRuntimeKey, @YES, OBJC_ASSOCIATION_COPY_NONATOMIC);
//    }
//    
//    - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//        
//        // 说明: 取出以 kRuntimeKey 为key 与 self 绑定起来的对象。
//        id obj = objc_getAssociatedObject(self, kRuntimeKey);
//        if (obj) {
//            NSLog(@"取出为: %@",obj);
//        }
//}
