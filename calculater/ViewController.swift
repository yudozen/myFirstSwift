//
//  ViewController.swift
//  calculater
//
//  Created by Yuki Nakamura on 2015/12/09.
//  Copyright © 2015年 Yuki Nakamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var screen: UILabel!
    var firstNumber = Int()
    var secondNumber = Int()
    var isTypingNumber = false
    var result = Int()
    var operation = ""
    var historyItems = [String]()

    @IBAction func number(sender: AnyObject) {
        let number = sender.currentTitle
        if isTypingNumber == true {
            screen.text = screen.text! + number!!
        } else {
            screen.text = number;
        }
        isTypingNumber = true
        
    }
    
    @IBAction func operation(sender: AnyObject) {
        isTypingNumber = false
        firstNumber = Int(screen.text!)!
        operation = sender.currentTitle!!
    }
    
    @IBAction func equel(sender: AnyObject) {
        secondNumber = Int(screen.text!)!
        if operation == "+" {
            result = firstNumber + secondNumber
        } else if operation == "-" {
            result = firstNumber - secondNumber
        } else if operation == "*" {
            result = firstNumber * secondNumber
        } else {
            result = firstNumber / secondNumber
        }
        screen.text = "\(result)"
        
        let history = "\(firstNumber) \(operation) \(secondNumber) = \(result)"
        ModelHistory.sharedInstance.db.executeUpdate("insert into CalcHistory (note, created_at) values (:note, :created_at)", withParameterDictionary: ["note": history, "created_at": NSDate().timeIntervalSince1970])
 }
    
    @IBAction func clear(sender: AnyObject) {
        firstNumber = 0
        secondNumber = 0
        isTypingNumber = false
        result = 0
        screen.text = "\(result)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

