//
//  StatisticsViewController.swift
//  Assignment4
//
//  Created by Michelle on 7/13/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import UIKit

class SimulationViewController: UIViewController, EngineDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set SimulationViewController as the delegate of the StandardEngine singleton
        //http://stackoverflow.com/questions/29536080/swift-set-delegate-for-singleton
        
       StandardEngine.EngineSingleton.delegate = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(sender: AnyObject)
    {
    
        //UIButton which steps the delegate
        StandardEngine(rows: 20, cols: 20).step(StandardEngine(rows:20, cols:20).delegate as! [[CellState]])
        
        //invoke the step() method - singleton - when step button pressed
       StandardEngine(rows: 20, cols: 20).step(StandardEngine.EngineSingleton as! [[CellState]])
    }
    
    func engineDidUpdate(withGrid: GridProtocol)
    {
        var grid: [[CellState]] = [[]]
        var cols: Int = 20
        var rows: Int = 20
            {
            didSet
            {
                grid = []
                
                for _ in 0..<rows
                {
                    
                    var rowArray: [CellState] = []
                    
                    for _ in 0..<cols
                    {
                        rowArray.append(CellState.Empty)
                    }
                    
                    grid.append(rowArray)
                }
            }
        }
        
        weak var gridView: GridView!
        gridView.setNeedsDisplay()
    }
    
}





//SOURCES FOR ICONS:

// size generator: http://www.gieson.com/Library/projects/utilities/icon_slayer/#.V4e0fpMrK9Y
//app icon: https://icons8.com/web-app/for/ios7/life
