//
//  TableViewController.swift
//  calculater
//
//  Created by dozenyutaro on 2015/12/19.
//  Copyright © 2015年 Yuki Nakamura. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, TabBarControllerDelegate{

    var historyItems = [String]()
    
    func setHistory(historyItems:[String]) {
        self.historyItems = historyItems
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return historyItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("datas")! as UITableViewCell
        cell.textLabel?.text = historyItems[indexPath.row]
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
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
