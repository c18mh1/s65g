//
//  ViewController.swift
//  Lecture6
//
//  Created by Summer on 7/11/16.
//  Copyright (c) 2016 Michelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ExampleDelegateProtocol {

    var example: ExampleProtocol!
    
    @IBOutlet weak var rows: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        example = Example()
        example.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func example(example: Example, didUpdateRows modelRows: UInt) {
        rows.text = String(modelRows)
    }
    
    @IBAction func increment (sender: AnyObject)
    {
        example.rows += 10
    }

}

