//
//  DRAliCloudVC.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/21.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit


class DRAliCloudVC: UIViewController {
    
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
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)

        let c = DRAliCloudDateVC();
        c.hidesBottomBarWhenPushed = true;
        self.navigationController?.pushViewController(c, animated: true);
    }
}
