//
//  BookingTimeTableViewCell.swift
//  Fut5
//
//  Created by JAMES BRAY on 7/8/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class BookingTimeTableViewCell: UITableViewCell {
    @IBOutlet weak var bookingTimeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func bookNowOnTouchUp(sender: UIButton) {
    }
}
