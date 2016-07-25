//
//  DRScrollAdvertView.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/25.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit

class DRScrollAdvertView: UIView {

    var scrollView: UIScrollView!
    
    internal class func scrollAdvertViewWithFrame(frame: CGRect) -> DRScrollAdvertView {
        let scrollAdvertView = DRScrollAdvertView.init(frame: frame)
        scrollAdvertView.scrollView = UIScrollView.init(frame: frame)
        scrollAdvertView.addSubview(scrollAdvertView.scrollView)
        scrollAdvertView.setScrollView();
        scrollAdvertView.setImageViews();
        return scrollAdvertView;
    }

    private func setScrollView() -> Void {
        self.scrollView.contentSize = CGSizeMake(self.frame.width * 4, 0);
        self.scrollView.scrollEnabled = true;
        self.scrollView.pagingEnabled = true;
        self.scrollView.showsHorizontalScrollIndicator = false;
        self.scrollView.showsVerticalScrollIndicator = false;
    }

    private func setImageViews() -> Void {
        for index in 0...3 {
            let image = UIImageView.init(frame: CGRectMake(CGFloat(index) * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height))
            self.scrollView.addSubview(image)
            switch index {
            case 0:
                image.backgroundColor = UIColor.orangeColor();
            case 1:
                image.backgroundColor = UIColor.blueColor();
            case 2:
                image.backgroundColor = UIColor.yellowColor();
            default:
                break
            }
        }
    }
}
