//
//  DRBaseScanfCodeSettingView.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/21.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit

class DRBaseScanfCodeSettingView: UIView {

    internal class func baseScanfCodeSettingViewWithFrame(frame: CGRect) -> (DRBaseScanfCodeSettingView) {
        let baseScanfCodeSettingView = NSBundle.mainBundle().loadNibNamed("DRBaseScanfCodeSettingView", owner: nil, options: nil).first as! DRBaseScanfCodeSettingView;
        baseScanfCodeSettingView.autoresizingMask = .None;
        baseScanfCodeSettingView.frame = frame;
        return baseScanfCodeSettingView;
    }
    
}
