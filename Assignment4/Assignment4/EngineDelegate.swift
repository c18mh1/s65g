//
//  EngineDelegate.swift
//  Assignment4
//
//  Created by Michelle on 7/14/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import Foundation

protocol EngineDelegate
{
    func engineDidUpdate (withGrid: GridProtocol)
}

class EngineDelegateImplementation: EngineDelegate
{
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
    
}//class