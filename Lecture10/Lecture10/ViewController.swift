//
//  ViewController.swift
//  Lecture10
//
//  Created by Michelle on 7/25/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fetch(sender: AnyObject)
    {
        
        let url = NSURL(string: "url")!
            let fetcher = Fetcher()
            fetcher.requestJSON(url) { (json, message) in
                if let json = json
                let op = NSBlockOperation {
                {
                    self.textView.text = json.description
                }
                
                else if let message = message
                {
                    self.textView.text = message
                }
                    
                else
                {
                    self.textView.text = "WTF?"
                }
            }
                
                NSOperationQueue.mainQueue().addOperation(block)
        }
    }

}

