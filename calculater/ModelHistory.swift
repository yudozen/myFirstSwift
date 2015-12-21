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
    
    var db : FMDatabase!
    
    override init(){
        super.init()
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first! as String
        let path = dirPath.stringByAppendingString("/temp.db")
        print(path)
        db = FMDatabase(path: path)
        db.open()
        db.executeStatements("create table if not exists CalcHistory (id integer primary key autoincrement, note text, created_at integer)")
    }
    
    deinit {
        db.close()
    }
    
    func getList(params: Dictionary<String,AnyObject>?){
        
        let resultSet = db.executeQuery("select * from CalcHistory", withParameterDictionary: nil)
        while resultSet.next() {
            self.add(["item": resultSet.stringForColumn("note")])
        }
    }
}