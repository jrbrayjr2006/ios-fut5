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
    
    override init() {
        self.username = "anonymous";
    }
    
    init(_username : String) {
        self.username = _username;
    }
    
    var id : String?
    var username : String?;
    var password : String?;
    var firstname : String?;
    var lastname : String?;
    
    // set the initial bookings to an empty array
    var myBookings : [Booking] = [];
   
}
