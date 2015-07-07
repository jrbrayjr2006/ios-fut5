//
//  User.swift
//  Fut5
//
//  Created by JAMES BRAY on 6/29/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class User: NSObject {
    
    // Singleton implementation
    class var sharedInstance : User {
        struct Static {
            static let instance : User = User();
        }
        return Static.instance;
    }
    
    var username : String?;
    var password : String?;
   
}
