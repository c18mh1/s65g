//
//  StandardEngine.swift
//  FinalProject
//
//  Created by Michelle.
//  Copyright © 2016 Michelle. All rights reserved.
//

import Foundation
import UIKit

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
    
    //from lecture 8 in class
    func livingNeighbors (cell: Grid.Cell) -> Int
    {
        //call neighbors function, reduce $0 + if new element is alive + 1
        let neighborPositions = grid.neighbors(cell.position)
        var living = 0
        
        for x in 0..<neighborPositions.count
        {
            let gridX = neighborPositions[x]
            
            if (grid[row: gridX.row, column: gridX.column].isAlive())
            {
                living = living + 1
            }
            else
            {
                living = living + 0
            }
        }
        
        return living
    }
    
    func step(grid:[Grid.Cell]) -> [Grid.Cell]
    {
        return grid.map {
            
            let livingNeighborsCall = livingNeighbors($0)
            switch livingNeighborsCall
            {
            case let livingNeighborsCall where livingNeighborsCall < 2  && $0.state.isAlive() == true: return (($0.position.row, $0.position.column), .Died)
                
            case let livingNeighborsCall where livingNeighborsCall == 2 && $0.state.isAlive() == true: return (($0.position.row, $0.position.column), .Born)
                
            case livingNeighborsCall where livingNeighborsCall == 3 && $0.state.isAlive() == true: return (($0.position.row, $0.position.column), .Born)
                
            case livingNeighborsCall where livingNeighborsCall > 3 && $0.state.isAlive() == true: return (($0.position.row, $0.position.column), .Died)
                
            default: return (($0.position.row, $0.position.column), .Empty)
            }
        }
    }

    //singleton, http://krakendev.io/blog/the-right-way-to-write-a-singleton
    //grid of 10x10 by default
   static let EngineSingleton = StandardEngine(rows: 10, cols: 10)
    

    
}//class