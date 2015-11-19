//
//  MissionDetailsViewController.swift
//  BucketList
//
//  Created by Huy Tran on 11/18/15.
//  Copyright © 2015 Chris Tran. All rights reserved.
//

import UIKit

class MissionDetailsViewController: UITableViewController {
    weak var cancelButtonDelegate: CancelButtonDelegate?
    
    @IBAction func cancelBarButtonPressed(sender: UIBarButtonItem) {
        cancelButtonDelegate?.cancelButtonPressedFrom(self)
    }
}
