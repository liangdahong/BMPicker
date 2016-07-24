//
//  DRAliCloudVC.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/21.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit

class DRAliCloudVC: DRBaseVC {
    
    @IBOutlet weak var newsTableView: UITableView!
    lazy var newsArray = NSMutableArray();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 1...arc4random_uniform(50)+20 {
            self.newsArray.addObject("模拟数据 - \(index)")
        }
        self.newsTableView.addPullToRefreshWithAction {
            NSOperationQueue().addOperationWithBlock {
                sleep(2)
                NSOperationQueue.mainQueue().addOperationWithBlock {
                    for index in 1...arc4random_uniform(50)+20 {
                        self.newsArray.addObject("模拟数据 - \(index)")
                    }
                    self.newsTableView.stopPullToRefresh()
                    self.newsTableView.reloadData();
                }
            }
        };
        
        let scanfCodeItem = UIBarButtonItem.init(title: "扫一扫", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(scanfCodeClick))
        self.navigationItem.leftBarButtonItem = scanfCodeItem;
    }
    
    @objc private func scanfCodeClick() -> () {
        
        let c = DRScanfCodeVC.baseScanfCodeVCWithScanfCodeBlock { (codeString) in
            let alert = DRAlert.alert(.alert, title: codeString, mess: nil);
            alert.addButtonWithTitle("确定", block: {
            });
            alert.show();
        };
        c.hidesBottomBarWhenPushed = true
        c.view.backgroundColor = UIColor.whiteColor();
        self.navigationController?.pushViewController(c, animated: true)
    }
}

extension DRAliCloudVC : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsArray.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = (tableView.dequeueReusableCellWithIdentifier("ID"));
        if cell == nil {
            cell = UITableViewCell.init(style: .Default, reuseIdentifier: "ID");
        }
        cell?.textLabel?.text = "模拟数据 - \(indexPath.row)"
        return cell!;
    }
}

extension DRAliCloudVC : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row%2 == 0 {
            let alert = UIAlertController.init(title: "温馨提示", message: nil, preferredStyle: .ActionSheet)
            alert.addAction(UIAlertAction.init(title: "cancel", style: .Cancel, handler: nil));
            alert.addAction(UIAlertAction.init(title: "BUTTON1", style: .Default, handler: nil));
            alert.addAction(UIAlertAction.init(title: "BUTTON2", style: .Default, handler: nil));
            self.presentViewController(alert, animated: true, completion: nil);
            return;
        }
        let alert = UIAlertController.init(title: "温馨提示", message: nil, preferredStyle: .Alert)
        alert.addAction(UIAlertAction.init(title: "cancel1", style: .Destructive, handler: nil));
        alert.addAction(UIAlertAction.init(title: "cancel2", style: .Default, handler: nil));
        self.presentViewController(alert, animated: true, completion: nil);
        
    }
}
