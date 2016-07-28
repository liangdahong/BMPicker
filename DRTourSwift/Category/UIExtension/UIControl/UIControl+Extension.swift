//
//  UIControl+Extension.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/28.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import Foundation
import UIKit

var kControlEventsModelKey = "kDaredos_ControlEventsModel_Runtime_Key"

// MARK: ControlEventsModel

class ControlEventsModel: NSObject {
    var controlEvents = UIControlEvents()
    var block: () -> () = {};

    internal func touchEvents() -> () {
        
        self.block()
    }
}

// MARK: UIControl - extension
extension UIControl {

    // MARK: internal

    /*!
     添加事件回调
     
     - parameter controlEvents: 事件类型
     - parameter actionBlock:   回调block
     */
    internal func addTouchEventsWithControlEvents(controlEvents: UIControlEvents, actionBlock: (() -> ())) -> () {
        let obj = ControlEventsModel();
        obj.block = actionBlock;
        self.getControlEventsModels().addObject(obj);
        self.addTarget(obj, action: #selector(obj.touchEvents), forControlEvents: controlEvents);
    }

    /*!
     删除对应的事件回调
     
     - parameter controlEvents: 事件
     */
    ///SSS
    internal func removeTouchEventsWithControlEvents(controlEvents: UIControlEvents) -> () {
        
        if self.getControlEventsModels().count == 0 {
            return;
        }
        for index in 0...self.getControlEventsModels().count {
            let obj = self.getControlEventsModels()[index] as! ControlEventsModel;
            if obj.controlEvents == controlEvents {
                self.getControlEventsModels().removeObject(obj);
                return;
            }
        }
    }

    /*!
     删除所有事件回调
     */
    internal func removeAllTouchEvents() -> () {
        self.getControlEventsModels().removeAllObjects();
    }

    // MARK: private
    private func getControlEventsModels() -> (NSMutableArray) {
        var controlEventsModels = objc_getAssociatedObject(self, &kControlEventsModelKey)
        if controlEventsModels == nil {
            controlEventsModels = NSMutableArray();
            objc_setAssociatedObject(self, &kControlEventsModelKey, controlEventsModels, .OBJC_ASSOCIATION_RETAIN)
        }
        return controlEventsModels as! NSMutableArray;
    }
}

