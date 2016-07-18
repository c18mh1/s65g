//
//  SecondViewController.swift
//  Assignment4
//
//  Created by Michelle on 7/13/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {

    @IBOutlet weak var livingLabel: UILabel!
    @IBOutlet weak var bornLabel: UILabel!
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var diedLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(gotNotification), name: "GridNotification", object: nil)
    }
    
//    let observer = NSNotificationCenter.defaultCenter().addObserver(self as! AnyObject, selector: #selector(gotNotification), name: "GridNotification", object: nil)
 
    
  
    func gotNotification(notification: NSNotification)
    {
        let classWithGrid = GridView()
        let gridToCheck = classWithGrid.grid
        var livingCount = 0
        var bornCount = 0
        var emptyCount = 0
        var diedCount = 0
        
        for x in 0..<gridToCheck.count
        {
            for y in 0..<gridToCheck[x].count
            {
                if gridToCheck[x][y] == .Living
                {
                    livingCount = livingCount + 1
                    
                }
                
                else if gridToCheck[x][y] == .Born
                {
                    bornCount = bornCount + 1
                }
                
                else if gridToCheck[x][y] == .Empty
                {
                    emptyCount = emptyCount + 1
                }
                
                else if gridToCheck[x][y] == .Died
                {
                    diedCount = diedCount + 1
                }
            }
        }
        
        livingLabel.text = ("\(livingCount)")
        bornLabel.text = ("\(bornCount)")
        emptyLabel.text = ("\(emptyCount)")
        diedLabel.text = ("\(diedCount)")
    }


}//class

