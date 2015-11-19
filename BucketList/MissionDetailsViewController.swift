//
//  MissionDetailsViewController.swift
//  BucketList
//
//  Created by Huy Tran on 11/18/15.
//  Copyright © 2015 Chris Tran. All rights reserved.
//

import UIKit

class MissionDetailsViewController: UITableViewController {
    
    @IBOutlet weak var newMissionTextField: UITextField!
    
    // MARK: Delegates
    weak var cancelButtonDelegate: CancelButtonDelegate?
    weak var delegate: MissionDetailsViewControllerDelegate?
    
    // MARK: Actions
    @IBAction func doneBarButtonPressed(sender: UIBarButtonItem) {
        delegate?.missionDetailsViewController(self, didFinishAddingMission: newMissionTextField.text!)
    }
    
    @IBAction func cancelBarButtonPressed(sender: UIBarButtonItem) {
        cancelButtonDelegate?.cancelButtonPressedFrom(self)
    }
}
