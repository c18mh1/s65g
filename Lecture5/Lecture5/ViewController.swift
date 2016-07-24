//
//  ViewController.swift
//  Lecture5
//
//  Created by Michelle on 7/21/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let toPassToObservers: MyProtocol = MyClass()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(gotNotification), name: "MyNotification", object: nil)
        NSNotificationCenter.defaultCenter().postNotificationName("MyNotification", object: nil, userInfo: ["ObjectToPass" : toPassToObservers])
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    //either wrapping class or the protocoL: class
    func gotNotification(notif: NSNotification)
    {
        if let obj = notif.userInfo!["ObjectToPass"]
        {
            let myProtocol = obj as! MyProtocol
            print(myProtocol.myField)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //can also do the singelton in the app delegate
    //AppDelegate.MyProtocolSingleton.myField = 1 
    //access it without the parentheses, the parentheses creates a new instance of the class
}

