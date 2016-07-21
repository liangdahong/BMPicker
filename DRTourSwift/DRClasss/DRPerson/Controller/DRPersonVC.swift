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
        cell?.textLabel?.text = self.personArray[indexPath.row] as? String;
        return cell!;
    }
}

extension DRPersonVC : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
}