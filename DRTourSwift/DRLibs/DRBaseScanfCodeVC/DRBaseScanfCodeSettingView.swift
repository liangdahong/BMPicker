//
//  DRBaseScanfCodeSettingView.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/21.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit

let w = UIScreen.mainScreen().bounds.size.width;
let h = UIScreen.mainScreen().bounds.size.width;


class DRBaseScanfCodeSettingView: UIView {
    
    var linView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib();
        self.linView = UIImageView.init(frame: CGRectMake((w-200)/2.0, (h-64-200)/2.0, 200, 2));
        self.linView?.backgroundColor = UIColor.redColor();
        self.addSubview(self.linView!);
        self.linView?.layer.addAnimation(self.getAnimation(), forKey:nil);
    }
    
    internal class func baseScanfCodeSettingViewWithFrame(frame: CGRect) -> (DRBaseScanfCodeSettingView) {
        let baseScanfCodeSettingView = NSBundle.mainBundle().loadNibNamed("DRBaseScanfCodeSettingView", owner: nil, options: nil).first as! DRBaseScanfCodeSettingView;
        baseScanfCodeSettingView.autoresizingMask = .None;
        baseScanfCodeSettingView.frame = frame;
        return baseScanfCodeSettingView;
    }
    
    func getAnimation() -> (CABasicAnimation) {

        let animation = CABasicAnimation.init(keyPath: "position.x");
        animation.duration = 1.3333;
        animation.fromValue = "\((h-64-200)/2.0)";
        animation.toValue   = "\((h-64-200)/2.0+200)";
        animation.repeatCount = MAXFLOAT;
        animation.autoreverses = true;
       return animation;
    }
}
