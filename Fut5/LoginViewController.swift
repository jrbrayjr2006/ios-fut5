//
//  LoginViewController.swift
//  Fut5
//
//  Created by JAMES BRAY on 6/8/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameLoginTextView: UITextField!
    @IBOutlet weak var passwordLoginTextView: UITextField!
    
    let loginUrl : NSString = "http://54.88.113.204/soccerbooking/login.php";
    // http://www.swiftdeveloperblog.com/http-post-example-script/
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginOnTouchUp(sender: UIButton) {
        let username = usernameLoginTextView.text;
        let password = passwordLoginTextView.text;
        
        // required fields
        if(username.isEmpty || password.isEmpty) {
            displayAlertMessage("You must enter a username and password!");
            return;
        }
        
        // authenticate user
        let networkAdapter = NetworkAdapter(serviceUrl : loginUrl);
        var status : String = networkAdapter.login(username, password: password);
        
        // DEBUG statement
        println("The return status is \(status).");
        
        let user : User = User.sharedInstance;
        NSLog("Username is %@", user.username!);
        
        if status != "200" {
            var alertView:UIAlertView = UIAlertView();
            alertView.title = "Login Failed!"
            alertView.message = "Please try again!"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
            return;
        } else {
            // log user in
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn");
            self.dismissViewControllerAnimated(true, completion: nil);
        }
        
        //var dbUsername = NSUserDefaults.standardUserDefaults().objectForKey("username");
        //var dbPassword = NSUserDefaults.standardUserDefaults().objectForKey("password");
    }

    @IBAction func forgotPasswordActionOnTouchUp(sender: UIButton) {
    }
    
    @IBAction func needNewAccountOnTouchUp(sender: UIButton) {
    }
    
    func sendUserMessage(message: String) {
        
    }
    
    func displayAlertMessage(userMessage:String) {
        var myMessage = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, nil);
        
        myMessage.addAction(okAction);
        
        self.presentViewController(myMessage, animated: true, completion: nil);
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
