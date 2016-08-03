//
//  StatisticsViewController.swift
//  FinalProject
//
//  Created by Michelle.
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(gotNotification), name: "GridNotification", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(resetButtonPressed), name: "ResetButtonPressed", object: nil)
        // Dispose of any resources that can be recreated.
    }
    
    func resetButtonPressed(notification:NSNotification)
    {
        livingLabel.text = ""
        bornLabel.text = ""
        emptyLabel.text = ""
        diedLabel.text = ""
    }
    
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
                
                switch gridToCheck[x][y].state
                {
                case gridToCheck[x][y].state where gridToCheck[x][y].state == CellState.Living: livingCount = livingCount + 1
                case gridToCheck[x][y].state where gridToCheck[x][y].state == CellState.Born: bornCount = bornCount + 1
                case gridToCheck[x][y].state where gridToCheck[x][y].state == CellState.Empty: emptyCount = emptyCount + 1
                case gridToCheck[x][y].state where gridToCheck[x][y].state == CellState.Died: diedCount = diedCount + 1
                default: livingCount = livingCount + 0
                }
                
            }
        }
        
        livingLabel.text = ("\(livingCount)")
        bornLabel.text = ("\(bornCount)")
        emptyLabel.text = ("\(emptyCount)")
        diedLabel.text = ("\(diedCount)")
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
