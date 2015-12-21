//
//  ModelBase.swift
//  calculater
//
//  Created by dozenyutaro on 2015/12/21.
//  Copyright © 2015年 Yuki Nakamura. All rights reserved.
//

class ModelBase: NSObject {
    dynamic var list: [Dictionary<String,AnyObject>] = [Dictionary<String,AnyObject>]()
    
    func get(row: Int) -> Dictionary<String,AnyObject> {
        return self.list[row]
    }
    
    func set(row: Int, data: Dictionary<String,AnyObject>) {
        self.list[row] = data
    }
    
    func getAll() -> [Dictionary<String,AnyObject>] {
        return self.list
    }
    
    func remove(row: Int) {
        self.list.removeAtIndex(row)
    }
    
    func add(data: Dictionary<String,AnyObject>) {
        self.list.insert(data, atIndex: self.list.count)
    }
}
