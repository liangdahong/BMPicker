//
//  DRAliCloudCell.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/25.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit

class DRAliCloudCell: UITableViewCell {

    class func cellWithTableView(tableview: UITableView) -> DRAliCloudCell {
        var cell = tableview.dequeueReusableCellWithIdentifier("DRAliCloudCell")
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("DRAliCloudCell", owner: nil, options: nil).first as! DRAliCloudCell;
        }
        return DRAliCloudCell();
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
