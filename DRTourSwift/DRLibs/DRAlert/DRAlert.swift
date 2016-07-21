//
//  DRAlert.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/20.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit

enum DRAlertType: Int {
    case alert = 0, sheet
}

// MARK: - DRAlert
class DRAlert: UIView {
    
    var alertView: UIAlertView?;
    var actionSheet: UIActionSheet?;
    var alertController: UIAlertController?;
    var type: DRAlertType = .alert
    var blocks: [() -> ()] = [];
    
    internal class func alert(type: DRAlertType, title: String?, mess: String?) -> (DRAlert) {

        let alert = DRAlert();

        if type == .alert {
            if UIDevice.currentDevice().systemVersion < "8.0" {
                alert.alertView = UIAlertView.init(title: title, message: mess, delegate: alert, cancelButtonTitle: nil)
            }else{
                alert.alertController = UIAlertController.init(title: title, message: mess, preferredStyle: .Alert)
            }
        }else {
            if UIDevice.currentDevice().systemVersion < "8.0" {
                alert.actionSheet = UIActionSheet.init(title: title, delegate: alert, cancelButtonTitle: nil, destructiveButtonTitle: nil)
            }else{
                alert.alertController = UIAlertController.init(title: title, message: mess, preferredStyle: .ActionSheet)
            }
        }
        alert.type = type;
        
        UIApplication.sharedApplication().keyWindow?.addSubview(alert);
        return alert;
    }

    internal func addButtonWithTitle(title: String?, block: (() -> ())) -> () {

        if type == .alert {
            
            if UIDevice.currentDevice().systemVersion < "8.0" {
                self.alertView?.addButtonWithTitle(title);
                self.blocks.append(block);
            }else{
                let action = UIAlertAction.init(title: title, style: .Default, handler: { (action) in
                    block();
                })
                self.alertController?.addAction(action)
            }
        }else{
            if UIDevice.currentDevice().systemVersion < "8.0" {
                self.actionSheet?.addButtonWithTitle(title);
                self.blocks.append(block);

            }else{
                let action = UIAlertAction.init(title: title, style: .Default, handler: { (action) in
                    block();
                })
                self.alertController?.addAction(action)
            }
        }
    }

    internal func show() -> () {

        if self.alertView != nil {
            self.alertView?.show();

        }else if self.actionSheet != nil {
            
            self.actionSheet?.showInView(self.getTopViewController()!.view)
            
        }else if self.alertController != nil {

            self.getTopViewController()!.presentViewController(self.alertController!, animated: true, completion: nil)
        }
    }
}


// MARK: - UIAlertViewDelegate
extension DRAlert : UIAlertViewDelegate {

    private func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {

        if self.blocks.count < (buttonIndex + 1) {
            return;
        }
        self.blocks[buttonIndex]();
        self.removeFromSuperview();
    }
}

// MARK: - UIActionSheetDelegate
extension DRAlert : UIActionSheetDelegate {

    private func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        if self.blocks.count < (buttonIndex + 1) {
            return;
        }
        self.blocks[buttonIndex]();
        self.removeFromSuperview();
    }
}

// MARK: - 私有方法
extension DRAlert {

    private func getTopViewController() -> (UIViewController?) {

        let rootVC = UIApplication.sharedApplication().windows.first?.rootViewController;
        var topVC = rootVC;

        while topVC!.presentedViewController != nil {
            
            topVC = rootVC!.presentedViewController
        }
        return topVC
    }
}
