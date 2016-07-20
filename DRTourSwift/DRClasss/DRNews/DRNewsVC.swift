//
//  DRNewsVC.swift
//  DraedSwift
//
//  Created by Daredos on 16/7/20.
//  Copyright © 2016年 Daredos. All rights reserved.
//

import UIKit

class DRNewsVC: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    lazy var newsArray = NSMutableArray();

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor();

        var arc = arc4random_uniform(20)+10;
        while arc > 0 {
            self.newsArray.addObject("模拟数据 - \(arc)")
            arc -= 1;
        }
        
        self.newsTableView.addPullToRefreshWithAction {
            NSOperationQueue().addOperationWithBlock {
                sleep(2)
                NSOperationQueue.mainQueue().addOperationWithBlock {
                    var ar = arc4random_uniform(20)+10;
                    self.newsArray = NSMutableArray();
                    while ar > 0 {
                        self.newsArray.addObject("模拟数据 - \(ar)")
                        ar -= 1;
                    }
                    self.newsTableView.stopPullToRefresh()
                    self.newsTableView.reloadData();
                }
            }
        };
    }
}

extension DRNewsVC : UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = (tableView.dequeueReusableCellWithIdentifier("ID"));
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "ID");
            print("alloc");
            cell?.backgroundColor = UIColor.grayColor();
        }
        cell?.textLabel?.text = "模拟数据 - \(indexPath.row)"
        return cell!;
    }
}

extension DRNewsVC : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let alert = DRAlert.alert("\(self.newsArray.count - indexPath.row)", mess: "messmessmessmessmess", cancelBlock: {
            print("cancelBlock")
        }) {
            print("确定按钮")
        }
        alert.show();
    }
}
