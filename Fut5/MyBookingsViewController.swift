//
//  MyBookingsViewController.swift
//  Fut5
//
//  Created by JAMES BRAY on 6/11/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class MyBookingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myBookingsUITableView: UITableView!
    
    var myBookings : [Booking] = [Booking]();
    var user : User = User.sharedInstance;
    
    let url: String = "http://54.88.113.204/soccerbooking/getMyBookings.php";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getMyBookings();
        self.myBookingsUITableView.registerClass(MyBookingTableViewCell.self, forCellReuseIdentifier: "bookingCell");
        self.myBookingsUITableView.backgroundColor = UIColor.clearColor();
        self.myBookingsUITableView.rowHeight = 180.0;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissMyBookingsViewOnTouchUp(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myBookings.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "myBookingCell";
        var cell : MyBookingTableViewCell = self.myBookingsUITableView.dequeueReusableCellWithIdentifier(cellIdentifier) as MyBookingTableViewCell;
        
        let startTime : String = myBookings[indexPath.row].bookingStartTime!;
        let endTime : String = myBookings[indexPath.row].bookingEndTime!;
        let fieldName : String = myBookings[indexPath.row].soccerFieldName!;
        //myBookings[indexPath.row]
        cell.myBookingDateLabel.text = myBookings[indexPath.row].bookingDate;
        cell.myBookingTimeLabel.text = "\(startTime) to \(endTime) at \(fieldName)";
        cell.backgroundColor = UIColor.clearColor();
        
        NSLog("The time is : %@", self.myBookings[indexPath.row].bookingStartTime!);
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        //TODO under construction
        
        println("You selected cell #\(indexPath.row)!")
    }
    
    // populate the myBookings array
    func getMyBookings() -> [Booking] {
        
        if(user.id != nil) {
            NSLog("My user id is %@", user.id!);
        }
        
        var networkAdapter : NetworkAdapter = NetworkAdapter(serviceUrl : url);
        self.myBookings = networkAdapter.getMyBookings(user.id!);
        
        if(self.myBookings.isEmpty) {
            var booking1 : Booking = Booking(startTime: "10:00 AM", endTime: "11:00 AM", date: "8/21/2015")
            myBookings.append(booking1);
        }
        
        return self.myBookings;
    }

}
