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
 
    func step(before: [[CellState]]) -> GridProtocol
    {
        var after: [[CellState]] = [[]]
        
        for x in 0..<before.count
        {
            for y in 0..<before[x].count
            {
                let gridClass = Grid(rows: x, cols: y)
                let neighborsFunction = gridClass.neighbors(x, col: y)
                
                var neighborArray: [(Int, Int)] = neighborsFunction
                
                for i in 0..<neighborArray.count
                {
                    let xcor = neighborArray[i].0
                    let ycor = neighborArray[i].1
                    
                    var live = 0;
                    
                    //count alive neighbors
                    if(before[xcor][ycor] == .Living)
                    {
                        live = live + 1
                    }
                    
                    //if alive
                    if(before[x][y] == .Living)
                    {
                        if(live<2)
                        {
                            after[x][y] = .Died
                        }
                            
                        else if (live == 2 || live==3)
                        {
                            after[x][y] = .Born
                        }
                            
                        else if (live>3)
                        {
                            after[x][y] = .Died
                        }
                    }//if alive
                        
                    else if (before[x][y] == .Empty)
                    {
                        if (live == 3)
                        {
                            after[x][y] = .Born
                        }
                    }
                }
            }
        }

        return after as! GridProtocol
    }

    //singleton, http://krakendev.io/blog/the-right-way-to-write-a-singleton
    //creates a grid of size 10x10 by default
    static let EngineSingleton = StandardEngine(rows: 10, cols: 10)
    
} //class
 

 