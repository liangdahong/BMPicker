//
//  DRPersonVC.swift
//  DraedSwift
//
//  Created by Daredos on 16/7/20.
//  Copyright © 2016年 Daredos. All rights reserved.
//

import UIKit

class DRPersonVC: DRBaseVC {
    
    @IBOutlet weak var personTableView: UITableView!
    lazy var personArray = NSMutableArray();

    override func viewDidLoad() {
        super.viewDidLoad()

        self.personArray.addObject(["我的直播", "我的云栖大会"]);
        self.personArray.addObject(["当月消费", "账户余额"]);
        self.personArray.addObject(["推荐码", "代金券"]);
        self.personArray.addObject(["设置"]);
        self.personArray.addObject(["意见反馈"]);
        self.personArray.addObject(["关于开发者(哈哈)"]);
        self.setUI();
    }
    
    func setUI() -> () {
        
        // 消息item
        let item = UIBarButtonItem.init(barButtonSystemItem: .Add, target: self, action: #selector(DRPersonVC.newsClick))
        self.navigationItem.rightBarButtonItem = item;
        
        // head
        self.personTableView.tableHeaderView = DRPersonTopView.personTopViewWithHeadImageURLString("", name: "", nickName: "", headBlock: { 
        });
    }
    
    func newsClick() -> () {
        self.navigationController?.pushViewController(DRNewsVC.viewController(), animated: true);
    }
}

extension DRPersonVC : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.personArray.count;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr = self.personArray[section];
        return arr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = (tableView.dequeueReusableCellWithIdentifier("ID"));
        if cell == nil {
            cell = UITableViewCell.init(style: .Default, reuseIdentifier: "ID");
            cell?.textLabel?.font = UIFont.systemFontOfSize(15)
            cell?.accessoryType = .DisclosureIndicator;
        }
        let arr = self.personArray[indexPath.section];
        cell?.textLabel?.text = arr[indexPath.row] as? String;
        return cell!;
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if section + 1 == self.personArray.count {
            return 20.0;
        }
        return 0.0000001;
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20;
    }
}

extension DRPersonVC : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        let c = DRSettingVC()
        let arr = self.personArray[indexPath.section];
        c.title = arr[indexPath.row] as? String;
        c.view.backgroundColor = UIColor.orangeColor();
        self.navigationController?.pushViewController(c, animated: true);
    }
}