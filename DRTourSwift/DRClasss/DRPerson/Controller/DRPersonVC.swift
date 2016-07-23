//
//  DRPersonVC.swift
//  DraedSwift
//
//  Created by Daredos on 16/7/20.
//  Copyright © 2016年 Daredos. All rights reserved.
//

import UIKit

class DRPersonVC: UIViewController {
    
    @IBOutlet weak var personTableView: UITableView!
    lazy var personArray = NSMutableArray();

    override func viewDidLoad() {
        super.viewDidLoad()

        for index in 1...arc4random_uniform(10)+5 {
            self.personArray.addObject("设置 - \(index)")
        }
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension DRPersonVC : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personArray.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = (tableView.dequeueReusableCellWithIdentifier("ID"));
        if cell == nil {
            cell = UITableViewCell.init(style: .Default, reuseIdentifier: "ID");
        }
        if indexPath.row < 3 {
            cell!.backgroundColor = UIColor.blueColor()
        }else {
            cell!.backgroundColor = UIColor.whiteColor()
            cell?.backgroundView?.backgroundColor = UIColor.blueColor()
        }
        return cell!;
    }
}

extension DRPersonVC : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        let c = DRSettingVC()
        c.view.backgroundColor = UIColor.orangeColor();
        c.hidesBottomBarWhenPushed = true;
        self.navigationController?.pushViewController(c, animated: true);
    }
}