//
//  KnockoutTableViewCell.swift
//  Fut5
//
//  Created by JAMES BRAY on 7/13/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class KnockoutTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerUIImageView: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
