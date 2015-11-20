//
//  Mission.swift
//  BucketList
//
//  Created by Huy Tran on 11/19/15.
//  Copyright © 2015 Chris Tran. All rights reserved.
//

import Foundation
class Mission: NSObject, NSCoding {
    static var key: String = "Missions"
    static var schema: String = "bucketList"
    var mission: String
    var createdAt: NSDate
    
    init(mission: String) {
        self.mission = mission
        createdAt = NSDate()
    }
    
    // MARK: NSCoding protocol
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(mission, forKey: "misssion")
        aCoder.encodeObject(createdAt, forKey: "createdAt")
    }
    
    required init?(coder aDecoder: NSCoder) {
        mission = aDecoder.decodeObjectForKey("mission") as! String
        createdAt = aDecoder.decodeObjectForKey("createdAt") as! NSDate
        super.init()
    }
    
    // MARK: Queries
    static func all() -> [Mission] {
        var missions = [Mission]()
        let path = Database.dataFilePath("bucketList")
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                missions = unarchiver.decodeObjectForKey(Mission.key) as! [Mission]
                unarchiver.finishDecoding()
            }
        }
        return missions
    }
    
    func save() {
        var missionsFromStorage = Mission.all()
        var exists = false
        for var i = 0; i < missionsFromStorage.count; ++i {
            if missionsFromStorage[i].createdAt == self.createdAt {
                missionsFromStorage[i] = self
                exists = true
            }
        }
        if !exists {
            missionsFromStorage.append(self)
        }
        Database.save(missionsFromStorage, toSchema: Mission.schema, forKey: Mission.key)
    }
}