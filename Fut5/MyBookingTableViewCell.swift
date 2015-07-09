//
//  MyBookingTableViewCell.swift
//  Fut5
//
//  Created by JAMES BRAY on 7/9/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class MyBookingTableViewCell: UITableViewCell {
    @IBOutlet weak var myBookingDateLabel: UILabel!
    @IBOutlet weak var myBookingTimeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func cancelBookingOnTouchUp(sender: UIButton) {
    }
}
