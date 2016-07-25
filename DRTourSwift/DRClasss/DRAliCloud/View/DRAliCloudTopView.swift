//
//  DRAliCloudTopView.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/25.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit


class DRAliCloudTopView: UIView {

    @IBOutlet weak var adScrollView: UIScrollView!
    @IBOutlet weak var selectScrollView: UIScrollView!

    internal class func aliCloudTopView() -> DRAliCloudTopView {
        let aliCloudTopView = NSBundle.mainBundle().loadNibNamed("DRAliCloudTopView", owner: nil, options: nil).first as! DRAliCloudTopView;
        aliCloudTopView.autoresizingMask = .None;
        aliCloudTopView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 410);
        
        aliCloudTopView.setadScrollView();
        aliCloudTopView.setselectScrollView();
        return aliCloudTopView;
    }

    private func setadScrollView() -> Void {
        
        for index in 0...3 {
            let image = UIImageView.init(frame: CGRectMake(CGFloat(index) * self.frame.size.width, 0, self.frame.size.width, 150))
            self.adScrollView.addSubview(image)
            switch index {
            case 0:
                image.backgroundColor = UIColor.orangeColor()
            case 1:
                image.backgroundColor = UIColor.blueColor()
            case 2:
                image.backgroundColor = UIColor.yellowColor()
            case 3:
                image.backgroundColor = UIColor.greenColor()
            default:
                break
            }
        }
        self.adScrollView.contentSize = CGSizeMake(self.frame.size.width * 4.0, 0)
    }

    private func setselectScrollView() -> Void {
        for index in 0...3 {
            let image = UIImageView.init(frame: CGRectMake(CGFloat(index) * self.frame.size.width, 0, self.frame.size.width, 100))
            image.layer.cornerRadius = 50;
            image.clipsToBounds = true;
            self.selectScrollView.addSubview(image)
            switch index {
            case 0:
                image.backgroundColor = UIColor.redColor()
            case 1:
                image.backgroundColor = UIColor.yellowColor()
            case 2:
                image.backgroundColor = UIColor.greenColor()
            case 3:
                image.backgroundColor = UIColor.blueColor()
            default:
                break
            }
        }
        self.selectScrollView.contentSize = CGSizeMake(self.frame.size.width * 4.0, 0)
    }
}
