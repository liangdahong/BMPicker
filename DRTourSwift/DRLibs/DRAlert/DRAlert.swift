//
//  DRAlert.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/20.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit

class DRAlert: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messLabel: UILabel!
    @IBOutlet weak var layoutC1: NSLayoutConstraint!
    @IBOutlet weak var layoutC2: NSLayoutConstraint!
    
    private var cancelBlock: (() -> ()) = {};
    private var confirmBlock: (() -> ()) = {};

    override func awakeFromNib() {
        super.awakeFromNib();
        self.layoutC1.constant = 0.5;
        self.layoutC2.constant = 0.5;
        self.frame = UIScreen.mainScreen().bounds;
        self.autoresizingMask = UIViewAutoresizing.None;
    }

    internal class func alert(title: String?, mess: String?, cancelBlock: (() -> ()), confirmBlock: (() -> ())) -> (DRAlert) {
        let alert = NSBundle.mainBundle().loadNibNamed("DRAlert", owner: nil, options: nil).first as! DRAlert;
        alert.titleLabel.text = title;
        alert.messLabel.text = mess;
        alert.cancelBlock = cancelBlock;
        alert.confirmBlock = confirmBlock;
        return alert;
    }

    internal func show() -> () {
        UIApplication.sharedApplication().keyWindow?.addSubview(self);
    }

    internal func diss() -> () {
        self.removeFromSuperview();
    }

    @IBAction func cancelButtonClick() {
        self.diss();
        self.cancelBlock();
    }
    
    @IBAction func confirmButtonClick() {
        self.diss();
        self.confirmBlock();
    }
}
