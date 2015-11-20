//
//  MissionDetailsViewControllerDelegate.swift
//  BucketList
//
//  Created by Huy Tran on 11/19/15.
//  Copyright © 2015 Chris Tran. All rights reserved.
//

import Foundation
protocol MissionDetailsViewControllerDelegate: class {
    func missionDetailsViewController(controller: MissionDetailsViewController, didFinishAddingMission mission: Mission)
}