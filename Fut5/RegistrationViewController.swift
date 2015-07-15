//
//  RegistrationViewController.swift
//  Fut5
//
//  Created by JAMES BRAY on 6/8/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var firstnameTextView: UITextField!
    @IBOutlet weak var lastnameTextView: UITextField!
    @IBOutlet weak var usernameTextView: UITextField!
    @IBOutlet weak var emailTextView: UITextField!
    @IBOutlet weak var passwordTextView: UITextField!
    @IBOutlet weak var confirmTextView: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAccountOnTouchUp(sender: UIButton) {
        // get data from UI
        let firstname = firstnameTextView.text;
        let lastname = lastnameTextView.text;
        let username = usernameTextView.text;
        let email = emailTextView.text;
        let password = passwordTextView.text;
        let confirm = confirmTextView.text;
        
        // make sure all required fields have been entered
        if(username.isEmpty || password.isEmpty) {
            sendUserMessage("Please enter required data!");
        }
        
        
        // make sure passwords match
        if(password != confirm) {
            sendUserMessage("Password and confirmation do not match!");
            return;
        }
        
        
        // save the new account data
        NSUserDefaults.standardUserDefaults().setObject(firstname, forKey: "firstname");
        NSUserDefaults.standardUserDefaults().setObject(lastname, forKey: "lastname");
        NSUserDefaults.standardUserDefaults().setObject(username, forKey: "username");
        NSUserDefaults.standardUserDefaults().setObject(email, forKey: "email");
        NSUserDefaults.standardUserDefaults().setObject(password, forKey: "password");
    }

    @IBAction func alreadyHaveAccountHandler(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    func sendUserMessage(message: String) {
        messageLabel.text = message;
        //messageLabel.textColor = #cccccc;
    }
    
    func displayAlertMessage(userMessage:String) {
        var myMessage = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil);
        
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
