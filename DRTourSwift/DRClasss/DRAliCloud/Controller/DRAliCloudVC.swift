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
    // MARK: - -
    // MARK: - init
    // MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.tableHeaderView = DRAliCloudTopView.aliCloudTopView()
    }

    // MARK: - 公有方法
    // MARK: - 私有方法
    // MARK: - 事件响应
    //
    @objc private func scanfCodeClick() -> () {
        
    }
}

// MARK: - 系统delegate
// MARK: - UITableViewDataSource
extension DRAliCloudVC : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return DRAliCloudCell.cellWithTableView(tableView)
    }
}

// MARK: - UITableViewDelegate
extension DRAliCloudVC : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
}
// MARK: - 自定义delegate
