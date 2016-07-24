//
//  DRPersonTopView.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/24.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit

class DRPersonTopView: UIView {

    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    
    internal class func personTopViewWithHeadImageURLString(url: String, name: String, nickName: String, headBlock: (() -> ())) -> (DRPersonTopView){
        let view = NSBundle.mainBundle().loadNibNamed("DRPersonTopView", owner: nil, options: nil).first as! DRPersonTopView;
        view.frame = CGRectMake(0, 0, 0, 170);
        view.autoresizingMask = .None;
        view.backgroundColor = UIColor.init(colorLiteralRed: 22/255.0, green: 131/255.0, blue: 235/255.0, alpha: 1)
        return view;
    }
}