//
//  Booking.swift
//  Fut5
//
//  Created by JAMES BRAY on 7/8/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class Booking: NSObject {
    
    let TAG : String = "Booking";
    
    var userId : Int?;
    var bookingTimeId : Int?;
    var soccerFieldId : Int?
    var bookingTime : String?
    var bookingDate : String?;
    var time : TimeValue?;
    var soccerFieldName : String?;
    var bookingStartTime : String?
    var bookingEndTime : String?
    var duration : Int?;
    
    override init() {
        //
    }
    
    init(startTime : String, endTime : String, date : String) {
        self.bookingStartTime = startTime;
        self.bookingEndTime = endTime;
        self.bookingDate = date;
    }
   
}
