//
//  ViewController.swift
//  Lecture12
//
//  Created by Michelle on 8/1/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func alert(sender: AnyObject)
    {
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default) { _ in print("Something")})
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default) { _ in})
        alert.addAction(UIAlertAction(title: "Go back", style: .Default) { _ in})
        self.presentViewController(alert, animated: true) {}
    }
}

