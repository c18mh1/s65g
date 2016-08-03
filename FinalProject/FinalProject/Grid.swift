//
//  Grid.swift
//  FinalProject
//
//  Created by Michelle.
//  Copyright © 2016 Michelle. All rights reserved.
//

import Foundation

class Grid: GridProtocol
{
    //from lecture 8 in class
    
    typealias Position = (row: Int, column: Int)
    let neighboringPositions: [Position] =
    [
        (-1,-1), (-1, 0), (-1, 1),
        ( 0,-1),          ( 0, 1),
        ( 1,-1), ( 1, 0), ( 1, 1)
   
    ]
    
    var rows: Int
    var cols: Int
     
    required init(rows: Int, cols: Int)
    {
        self.rows = rows
        self.cols = cols
    }

   
    typealias Cell = (position: Position, state: CellState)
    var grid: [[Cell]] = [[]]
    
    func neighbors(position: Position) -> [Position]
    {
        let rowNeighboring = position.row + rows
        let colNeighboring = position.column + cols
        return neighboringPositions.map { ((rowNeighboring+$0.row) % rows, (colNeighboring+$0.column) % cols)}
    }
    
    subscript(position: Position) -> CellState
    {
        get
        {
            assert(position.row >= 0 && position.row < rows && position.column >= 0 && position.column < cols, "Bounds error")
            return grid[position.row][position.column].state
        }
        
        set
        {
           return grid[position.row][position.column].state = newValue
        }
    }
}