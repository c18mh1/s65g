//
//  ViewController.swift
//  Lecture3
//
//  Created by Summer on 6/27/16.
//  Copyright (c) 2016 Summer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    @IBAction func buttonClicked(sender: AnyObject) {
        print ("We were clicked")
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

