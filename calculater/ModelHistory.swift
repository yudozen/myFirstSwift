//
//  ModelHistory.swift
//  calculater
//
//  Created by dozenyutaro on 2015/12/21.
//  Copyright © 2015年 Yuki Nakamura. All rights reserved.
//

class ModelHistory : ModelBase {
    
    class var sharedInstance : ModelHistory {
        struct Singleton {
            static var instance = ModelHistory()
        }
        return Singleton.instance
    }
    
    var db: FMDatabase!
    var lastTimestamp: NSTimeInterval = 0
    var outputFormat = NSDateFormatter()
    
    override init(){
        super.init()
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first! as String
        let path = dirPath.stringByAppendingString("/temp.db")
        print(path)
        db = FMDatabase(path: path)
        db.open()
        db.executeStatements("create table if not exists CalcHistory (id integer primary key autoincrement, note text, created_at integer)")
        
        outputFormat = NSDateFormatter()
        outputFormat.locale = NSLocale(localeIdentifier: "ja_JP")
        outputFormat.dateFormat = "[yy/MM/dd HH:mm:ss]"
    }
    
    deinit {
        db.close()
    }
    
    func getList(){
        let resultSet = db.executeQuery("select * from CalcHistory where created_at > :lastTimestamp order by created_at asc", withParameterDictionary: ["lastTimestamp": lastTimestamp])
        lastTimestamp = NSDate().timeIntervalSince1970
        
        while resultSet.next() {
            let date = NSDate(timeIntervalSince1970:Double(resultSet.stringForColumn("created_at"))!)
            self.add(["item": "\(outputFormat.stringFromDate(date))  \(resultSet.stringForColumn("note"))"])
        }
    }
}