//
//  DRAliCloudVC.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/21.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit
import Alamofire

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
        Alamofire.request(.GET, "http://api.breadtrip.com/trips/hot/?count=10&is_ipad=0&sign=f50d4ae601187d96bc637e76caf0b18d&start=1", parameters: nil)
            .responseJSON { response in
                print(response.request)
                print(response.response)
                print(response.data)
                print(response.result)
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
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
