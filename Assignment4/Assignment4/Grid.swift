//
//  Grid.swift
//  Assignment4
//
//  Created by Michelle on 7/18/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import Foundation

class Grid: GridProtocol
{
    var rows: Int
    var cols: Int
    var grid: [[CellState]] = [[]]
    
    required init(rows: Int, cols: Int)
    {
        self.rows = rows
        self.cols = cols
        self.grid = [[]]
    }
    
    subscript(row: Int, col: Int) -> CellState
        {
        get {
            assert(row >= 0 && row < rows && col >= 0 && col < cols, "Bounds error")
            return grid[row][col]
        }
        
        set {
            grid[row][col] = newValue
        }
    }
    
    
    
    func neighbors(row: Int, col column: Int) -> [(Int, Int)]
    {
        var neighbors: [(Int, Int)] = []
        
        let a: (Int, Int) = ((row+9)%10, (column+9)%10) //%10 is %rows, shorten don't repeat
        neighbors.append(a)
        
        let b: (Int, Int) = ((row%10), (column+9)%10)
        neighbors.append(b)
        
        let c: (Int, Int) = ((row+1)%10, (column+9)%10)
        neighbors.append(c)
        
        let d: (Int, Int) = ((row+9)%10, (column%10))
        neighbors.append(d)
        
        let e: (Int, Int) = ((row+1)%10, (column%10))
        neighbors.append(e)
        
        let f: (Int, Int) = ((row+9)%10, (column+1)%10)
        neighbors.append(f)
        
        let g: (Int, Int) = ((row%10), ((column+1)%10))
        neighbors.append(g)
        
        let h: (Int, Int) = ((row+1)%10, (column+1)%10)
        neighbors.append(h)
        
        return neighbors
    }
}