//
//  StandardEngine.swift
//  Assignment4
//
//  Created by Michelle on 7/15/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import Foundation


class StandardEngine: EngineProtocol
{

    
    var delegate: EngineDelegate?
    var grid: GridProtocol
    {
        didSet
        {
            //notify & publish grid object using NSNotification
            let notificationCenter = NSNotificationCenter.defaultCenter()
            let notification = NSNotification(name: "GridNotification", object: nil)
            notificationCenter.postNotification(notification)
            NSNotificationCenter.defaultCenter().postNotificationName("TestName", object: nil, userInfo: ["PublishGrid" : grid as! AnyObject])

        }
    }
    
    @objc func checkForNotifications(notification:NSNotification)
    {
        print("\(notification.name)")
    }
    
    var refreshRate: Double
    var refreshTimer: NSTimer?
    var rows: Int
    var cols: Int
    required init(rows: Int, cols: Int)
    {
        self.rows = rows
        self.cols = cols
        self.refreshRate = 0.0
        self.grid = Grid(rows: 10, cols: 10)
    }
 
    func step(before: GridProtocol) -> GridProtocol
    {
        var after: GridProtocol
        after = Grid(rows: before.rows, cols: before.cols)
        
        for row in 0..<before.rows
        {
            for col in 0..<before.cols
            {
                let gridClass = Grid(rows: row, cols: col)
                let neighborsFunction = gridClass.neighbors(row, col: col)
                var neighborArray: [(Int, Int)] = neighborsFunction
                
                for i in 0..<neighborArray.count
                {
                    let xcor = neighborArray[i].0
                    let ycor = neighborArray[i].1
                    
                    var live = 0;
                    
                    if (before[xcor, ycor] == .Living)
                    {
                        live = live + 1
                    }
                
                
                let currentCell = before[row, col]
                
                if (currentCell == .Living || currentCell == .Born)
                {
                    if live < 2
                    {
                        after[row,col] = .Died
                    }
                    
                    else if (live == 2 || live == 3)
                    {
                        after[row, col] = .Born
                    }
                    
                    else if (live > 3)
                    {
                        after[row, col] = .Died
                    }
                    
                }
                    
                else if (currentCell == .Died || currentCell == .Empty)
                {
                    if live == 3
                    {
                        after[row, col] = .Born
                    }
                }
                
                }
            }
        }
        
        return after
    }//step

    //singleton, http://krakendev.io/blog/the-right-way-to-write-a-singleton
    //creates a grid of size 10x10 by default
    static let EngineSingleton = StandardEngine(rows: 10, cols: 10)
    
} //class
 

 