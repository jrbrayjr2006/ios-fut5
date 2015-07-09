//
//  NetworkAdapter.swift
//  Fut5
//
//  Created by JAMES BRAY on 6/29/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit
import Foundation

/**
* This class is used to establish network connections with the web service
*/
class NetworkAdapter: NSObject {
    
    var serviceUrl : String?;
    var status : String?;
    
    // Try different approach to parsing json object
    var data : NSMutableData = NSMutableData();
    
    init(serviceUrl : NSString) {
        self.serviceUrl = serviceUrl;
    }
    
    
    func login(username : String, password : String) -> String {
        //var tmpUrl: String = "\(self.serviceUrl)?username=\(username)&password=\(password)";
        //var url: NSURL = NSURL(string : self.serviceUrl!)!;
        var post :NSString = "username=\(username)&password=\(password)";
        var newUrlString = String(self.serviceUrl!) + "?" + String(post);
        NSLog("This is the url:  %@", newUrlString);
        var url: NSURL = NSURL(string : newUrlString)!;
        
        NSLog("PostData: %@", post);
        
        var postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!;
        var postLength: NSString = String(postData.length);
        
        
        var request: NSMutableURLRequest = NSMutableURLRequest(URL: url);
        request.HTTPMethod = "POST";
        request.HTTPBody = postData;
        request.setValue(postLength, forHTTPHeaderField: "Content-Length");
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type");
        request.setValue("application/json", forHTTPHeaderField: "Accept");
        
        var responseError: NSError?;
        var response: NSURLResponse?;
        
        var urlData: NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse:&response, error:&responseError);
        
        if urlData == nil {
            NSLog("No data returned from request...");
        } else {
            NSLog("Data returned!");
        }
        
        let res = response as NSHTTPURLResponse!;
        
        NSLog("Response code: %ld", res.statusCode);
        
        self.status = String(res.statusCode);
        
        //var tmp:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
        //NSLog("The data is %s", tmp);
        
        if (res.statusCode >= 200 && res.statusCode < 300)
        {
            var responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
            
            NSLog("Response ==> %@", responseData);
            
            var error: NSError?
            
            let jsonData:NSDictionary = NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers , error: &error) as NSDictionary
            
            let mstatus:NSInteger = jsonData.valueForKey("status") as NSInteger;
            let success:NSString = jsonData.valueForKey("status_message") as NSString;
            
            let data:NSArray = jsonData.valueForKey("data") as NSArray;
            
            NSLog("Login Data %@", data);
            
            NSLog("Success: %ld", mstatus);
            
            if(success == "SUCCESS")
            {
                NSLog("Login SUCCESS");
                
                var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
                prefs.setObject(username, forKey: "USERNAME")
                prefs.setInteger(1, forKey: "ISLOGGEDIN")
                prefs.synchronize()
                
                var user : User = User.sharedInstance;
                user.username = username;
                
                //self.dismissViewControllerAnimated(true, completion: nil)
            } else {
                var error_msg:NSString
                
                if jsonData["status_message"] as? NSString != nil {
                    error_msg = jsonData["status_message"] as NSString
                } else {
                    error_msg = "Unknown Error"
                }
                var alertView:UIAlertView = UIAlertView()
                alertView.title = "Sign in Failed!"
                alertView.message = error_msg
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
                
            }
            
        }
        
        return self.status!;
    }
    
    // get soccer fields from server
    func getSoccerFields() -> [SoccerField] {
        var fields = [SoccerField]();
        
        //TODO under construction
        
        return fields;
    }
   
}
