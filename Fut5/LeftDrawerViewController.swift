//
//  LeftDrawerViewController.swift
//  Fut5
//
//  Created by JAMES BRAY on 6/16/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class LeftDrawerViewController: UIViewController {

    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getUserInfo();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func logoutOnTouchUp(sender: UIButton) {
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
        
        // Close the navigation drawer
        appDelegate.bookingContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil);
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn");
        
        // Close the app
        println("Closing Fut5...");
        //self.performSegueWithIdentifier("bookingToLoginSegue", sender: self);
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func openMyBookingsOnTouchUp(sender: UIButton) {
        NSLog("Opening My Bookings from left drawer...");
        var myBookingsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MyBookingsViewController") as MyBookingsViewController;
        
        var navController = UINavigationController(rootViewController: myBookingsViewController);
        
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
        
        appDelegate.bookingContainer!.centerViewController = myBookingsViewController;
        
        // Close the navigation drawer
        appDelegate.bookingContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil);
    }
    
    func getUserInfo() -> Void {
        var user : User = User.sharedInstance;
        var firstname : String? = user.firstname;
        var lastname : String? = user.lastname;
        var username : String? = user.username;
        
        if(firstname == nil) {
            user.firstname = "";
            firstname = "";
        }
        
        if(lastname == nil) {
            user.lastname = "";
            lastname = "";
        }
        
        self.fullnameLabel.text = "\(firstname!) \(lastname!)";
        self.usernameLabel.text = username;
    }

}
