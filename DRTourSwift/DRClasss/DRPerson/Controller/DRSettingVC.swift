//
//  DRSettingVC.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/23.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit

class DRSettingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension DRSettingVC : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell();
    }
}

extension DRSettingVC : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }
}