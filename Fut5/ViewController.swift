//
//  ViewController.swift
//  Fut5
//
//  Created by JAMES BRAY on 6/8/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var BookingTimesTableView: UITableView!
    @IBOutlet weak var bookingDateLabel: UILabel!
    
    var items: [String] = ["12:00 PM", "1:00 PM", "2:00 PM", "3:00 PM", "4:00 PM", "5:00 PM", "6:00 PM", "7:00 PM", "8:00 PM", "9:00 PM"]
    
    var today : NSDate = NSDate();
    var dateFormatter : NSDateFormatter = NSDateFormatter();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.BookingTimesTableView.registerClass(BookingTimeTableViewCell.self, forCellReuseIdentifier: "bookingCell")
        // Do any additional setup after loading the view, typically from a nib.
        self.BookingTimesTableView.backgroundColor = UIColor.clearColor();
        
        dateFormatter.dateFormat = "MM/dd/y";
        self.bookingDateLabel.text = dateFormatter.stringFromDate(today);
        
        // The following line of code allows me to add a custom navigation background image to the navigation bar in iOS 8 and later
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "navigation_bar_background")!.resizableImageWithCapInsets(UIEdgeInsetsMake(0, 0, 0, 0), resizingMode: .Stretch), forBarMetrics: .Default)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        var isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn");
        
        if(!isUserLoggedIn) {
            self.performSegueWithIdentifier("bookingToLoginSegue", sender: self);
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // set isUserLoggedIn bool to false and show login screen
    @IBAction func logoutOnTouchUp(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn")
        self.performSegueWithIdentifier("bookingToLoginSegue", sender: self);
    }
    
    // there will only be 1 section in this table view
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    // create each cell for the table
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "bookingTimeCell";
        var cell = self.BookingTimesTableView.dequeueReusableCellWithIdentifier(cellIdentifier) as BookingTimeTableViewCell;
        //cell.textLabel?.text = self.items[indexPath.row]
        NSLog("The time is : %@", self.items[indexPath.row]);
        cell.bookingTimeLabel.text = self.items[indexPath.row];
        
        cell.backgroundColor = UIColor.clearColor();
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // adding dummy code for now
        var fieldName : String = "Default Field"
        displaySoccerBookingLength(fieldName)
        println("You selected cell #\(indexPath.row)!")
    }

    @IBAction func soccerFieldSelectButton(sender: UIButton) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn");
    }
    
    // Open the left navigation drawer
    @IBAction func leftDrawerOnTouchUp(sender: UIBarButtonItem) {
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
        appDelegate.bookingContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil);
    }
    
    
    // Generate the times to be displayed in the booking listing
    func generateTimes() -> [String] {
        var times: [String] = []
        return times
    }
    
    func displayAlertMessage(userMessage:String) {
        var myMessage = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, nil);
        
        myMessage.addAction(okAction);
        
        self.presentViewController(myMessage, animated: true, completion: nil);
    }
    
    func displaySoccerBookingLength(userMessage:String) {
        var myMessage = UIAlertController(title: "Select Duration of Booking", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let oneHourAction = UIAlertAction(title: "1 Hour", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) in
            //self.performSegueWithIdentifier("fromBookingsToMyBookings", sender: self);
            var centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MyBookingsViewController") as MyBookingsViewController;
            var centerNavController = UINavigationController(rootViewController: centerViewController);
            var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
            
            appDelegate.bookingContainer!.centerViewController = centerNavController;
            //appDelegate.bookingContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil);
        });
        let twoHourAction = UIAlertAction(title: "2 Hours", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) in
            //self.performSegueWithIdentifier("fromBookingsToMyBookings", sender: self);
            var centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MyBookingsViewController") as MyBookingsViewController;
            var centerNavController = UINavigationController(rootViewController: centerViewController);
            var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
            
            appDelegate.bookingContainer!.centerViewController = centerNavController;
        });
        
        myMessage.addAction(oneHourAction);
        myMessage.addAction(twoHourAction);
        
        // fromBookingsToMyBookings
        
        self.presentViewController(myMessage, animated: true, completion: nil);
    }
    
    // get available soccer fields
    func getSoccerFields() -> [String] {
        //TODO under construction
        return [];
    }

}

