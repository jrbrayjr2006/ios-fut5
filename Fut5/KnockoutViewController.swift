//
//  KnockoutViewController.swift
//  Fut5
//
//  Created by JAMES BRAY on 7/12/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class KnockoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var gameTimeLabel: UILabel!
    @IBOutlet weak var gameTime2Label: UILabel!
    @IBOutlet weak var numberOfPlayersLabel: UILabel!
    
    let joinList : String = "Join The List";
    let withdrawFromList : String = "Withdraw From List";
    
    
    @IBOutlet weak var knockoutTableView: UITableView!
    
    var playerNames: [String] = ["John Doe", "David Villa", "Thiago Silva"];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.knockoutTableView.registerClass(KnockoutTableViewCell.self, forCellReuseIdentifier: "knockoutTableViewCell");
        self.knockoutTableView.backgroundColor = UIColor.clearColor();
        
        var numberOfPlayers = String(self.playerNames.count);
        self.numberOfPlayersLabel.text = "\(numberOfPlayers) of TBD";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func leftDrawerNavOnTouchUp(sender: AnyObject) {
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
        appDelegate.bookingContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil);
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playerNames.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellIdentifier : String = "KnockoutTableViewCell";
        var cell : KnockoutTableViewCell  = self.knockoutTableView.dequeueReusableCellWithIdentifier(cellIdentifier) as KnockoutTableViewCell;
        
        cell.playerNameLabel.text = playerNames[indexPath.row];
        cell.backgroundColor = UIColor.clearColor();
        return cell;
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        //TODO under construction
        
        println("You selected cell #\(indexPath.row)!")
    }

    @IBAction func withdrawFromListOnTouchUp(sender: UIButton) {
    }
}
