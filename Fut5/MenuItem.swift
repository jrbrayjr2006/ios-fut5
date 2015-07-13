//
//  MenuItem.swift
//  Fut5
//
//  Created by JAMES BRAY on 7/12/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class MenuItem: NSObject {
    
    var menuItemLabelName : String?;
    var menuImageName : String?;
    
    init(_menuItemLabelName : String, _menuImageName : String) {
        self.menuItemLabelName = _menuItemLabelName;
        self.menuImageName = _menuImageName;
    }
   
}
