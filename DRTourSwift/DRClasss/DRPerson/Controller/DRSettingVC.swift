//
//  DRSettingVC.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/23.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit

class DRSettingVC: DRNotBaseVC {

    @IBOutlet weak var personTableView: UITableView!
    lazy var personArray = NSMutableArray();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.personArray.addObject(["消息设置"]);
        self.personArray.addObject(["清除缓存"]);
        self.personArray.addObject(["关于我们", "请过我们鼓励"]);
        self.personArray.addObject(["退出当前账号"]);
    }
}

extension DRSettingVC : UITableViewDataSource {
    
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
        cell?.textLabel?.textAlignment = .Left;
        if indexPath.section + 1 == self.personArray.count {
            cell?.textLabel?.textAlignment = .Center;
        }
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

extension DRSettingVC : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        if indexPath.section == 1 {
            let alert = UIAlertController.init(title: "确定清除缓存", message: nil, preferredStyle: .ActionSheet)
            alert.addAction(UIAlertAction.init(title: "确定", style: .Destructive, handler: { (aler) in
                
            }))
            alert.addAction(UIAlertAction.init(title: "取消", style: .Cancel, handler: { (aler) in
                
            }))
            self.presentViewController(alert, animated: true, completion: nil);
        }
        else if indexPath.section + 1 == self.personArray.count {
            let alert = UIAlertController.init(title: "确定退出当前账号", message: nil, preferredStyle: .ActionSheet)
            alert.addAction(UIAlertAction.init(title: "确定", style: .Destructive, handler: { (aler) in
                
            }))
            alert.addAction(UIAlertAction.init(title: "取消", style: .Cancel, handler: { (aler) in
                
            }))
            self.presentViewController(alert, animated: true, completion: nil);
        }
    }
}