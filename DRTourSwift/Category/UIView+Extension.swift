//
//  UIView+Extension
//  DRTourSwift
//
//  Created by Daredos on 16/7/25.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit

public extension UIView {
    
    public var dr_x: CGFloat {
        get {
            return self.frame.origin.x
        } set(newValue) {
            self.frame = CGRectMake(newValue, self.frame.origin.y, self.frame.size.width, self.frame.size.height)
        }
    }
    public var dr_y: CGFloat {
        get {
            return self.frame.origin.y
        } set(newValue) {
            self.frame = CGRectMake(self.frame.origin.x, newValue, self.frame.size.width, self.frame.size.height)
        }
    }
    public var dr_width: CGFloat {
        get {
            return self.frame.origin.x
        } set(newValue) {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newValue, self.frame.size.height)
        }
    }

    public var dr_height: CGFloat {
        get {
            return self.frame.origin.x
        } set(newValue) {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, newValue)
        }
    }

    public var dr_origin: CGPoint {
        get {
            return self.frame.origin
        } set(newValue) {
            self.frame = CGRectMake(newValue.x, newValue.y, self.frame.size.width, self.frame.size.height)
        }
    }
    
    public var dr_size: CGSize {
        get {
            return self.frame.size
        } set(newValue) {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newValue.width, newValue.height)
        }
    }
}