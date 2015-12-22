//
//  TableViewController.swift
//  calculater
//
//  Created by dozenyutaro on 2015/12/19.
//  Copyright © 2015年 Yuki Nakamura. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let list = ModelHistory.sharedInstance.getAll()
        return list.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("datas")! as UITableViewCell
        let data = ModelHistory.sharedInstance.get(indexPath.row)
        cell.textLabel?.text = data["item"] as? String
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        ModelHistory.sharedInstance.getList()
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsetsMake(15.0, 0, 0, 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
