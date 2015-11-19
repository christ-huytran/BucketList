//
//  BucketListViewController.swift
//  BucketList
//
//  Created by Huy Tran on 11/18/15.
//  Copyright © 2015 Chris Tran. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController, CancelButtonDelegate {

    var missions = ["Sky diving", "Live in Hawaii"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        // tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        // tableView.separatorColor = UIColor.blackColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // deque the cell from our storyboard
        let cell = tableView.dequeueReusableCellWithIdentifier("MissionCell")!
        // if the cell has a text label, set it to the model that is corresponding to the row in array
        cell.textLabel?.text = missions[indexPath.row]
        
        // return cell so that TableView knows what to draw in each row
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }
    
    func cancelButtonPressedFrom(controller: UIViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddNewMission" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! MissionDetailsViewController
            controller.cancelButtonDelegate = self
        }
    }

}

