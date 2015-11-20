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
        let newMission = Mission(mission: newMissionTextField.text!)
        newMission.save()
        print("\(newMission.createdAt)")
        delegate?.missionDetailsViewController(self, didFinishAddingMission: newMission)
    }
    
    @IBAction func cancelBarButtonPressed(sender: UIBarButtonItem) {
        cancelButtonDelegate?.cancelButtonPressedFrom(self)
    }
}
