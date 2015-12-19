//
//  TabBarController.swift
//  calculater
//
//  Created by dozenyutaro on 2015/12/19.
//  Copyright © 2015年 Yuki Nakamura. All rights reserved.
//

import UIKit

protocol TabBarControllerDelegate {
    func setHistory(historyItems:[String])
}

class TabBarController: UITabBarController, UITabBarControllerDelegate{

    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        if viewController is TabBarControllerDelegate {
            (viewController as! TabBarControllerDelegate).setHistory((self.viewControllers?.first as! ViewController).historyItems)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

