//
//  LeftDrawerViewController.swift
//  Fut5
//
//  Created by JAMES BRAY on 6/16/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class LeftDrawerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var leftDrawerMenuTableView: UITableView!
    
    var menuItems : [MenuItem] = [MenuItem]();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        setMenuItems();
        self.leftDrawerMenuTableView.registerClass(MenuItemTableViewCell.self, forCellReuseIdentifier: "MenuCell");
        self.leftDrawerMenuTableView.backgroundColor = UIColor.clearColor();

        // Do any additional setup after loading the view.
        getUserInfo();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
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
    
    func setMenuItems() -> Void {
        if(menuItems.isEmpty) {
            var menuItem1 : MenuItem = MenuItem(_menuItemLabelName: "Bookings", _menuImageName: "SideMenu__0011_Shape-137");
            var menuItem2 : MenuItem = MenuItem(_menuItemLabelName: "Knockout list", _menuImageName: "SideMenu__0010_Shape-101");
            var menuItem3 : MenuItem = MenuItem(_menuItemLabelName: "Settings", _menuImageName: "SideMenu__0009_Shape-15");
            var menuItem4 : MenuItem = MenuItem(_menuItemLabelName: "Log out", _menuImageName: "SideMenu__0008_Shape-434");
            
            self.menuItems.append(menuItem1);
            self.menuItems.append(menuItem2);
            self.menuItems.append(menuItem3);
            self.menuItems.append(menuItem4);
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier : String = "MenuItemCell";
        var cell : MenuItemTableViewCell = self.leftDrawerMenuTableView.dequeueReusableCellWithIdentifier(cellIdentifier) as MenuItemTableViewCell;
        
        //NSLog("The menu item is : %@", self.menuItems[indexPath.row]);
        let itemName : String = menuItems[indexPath.row].menuItemLabelName!;
        let imageName : String = menuItems[indexPath.row].menuImageName!;
        let image : UIImage = UIImage(named: imageName)!;
        cell.menuItemLabel.text = itemName;
        cell.menuItemImage.image = image;
        //cell.menuItemImage = UIImageView(image: image);
        cell.backgroundColor = UIColor.clearColor();
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch(indexPath.row) {
        case 0:
            var centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MyBookingsViewController") as MyBookingsViewController;
            var centerNavController = UINavigationController(rootViewController: centerViewController);
            var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
            
            appDelegate.bookingContainer!.centerViewController = centerNavController;
            appDelegate.bookingContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil);
            break;
        case 1:
            var bookingViewController = self.storyboard?.instantiateViewControllerWithIdentifier("BookingViewController") as ViewController;
            var bookingNavController = UINavigationController(rootViewController: bookingViewController);
            var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
            
            appDelegate.bookingContainer!.centerViewController = bookingNavController;
            appDelegate.bookingContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil);
            break;
        case 2:
            println("Feature not implemented yet...");
            break;
        case 3:
            var loginViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LoginViewController") as LoginViewController;
            var loginNavController = UINavigationController(rootViewController: loginViewController);
            var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
            
            appDelegate.bookingContainer!.centerViewController = loginNavController;
            appDelegate.bookingContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil);
            break;
        default:
            println("An row in the table has been touched...");
        }
    }

}
