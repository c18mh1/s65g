//
//  GridView.swift
//  FinalProject
//
//  Created by Michelle on 7/30/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import Foundation
import UIKit

let π: CGFloat = CGFloat(M_PI)
@IBDesignable

class GridView: UIView
{
    var grid[[Grid.Cell]] = [[]]
    
    @IBInspectable var rows: Int = 10
        {
        didSet
        {
            grid = []
            for x in 0..<rows
            {
                var rowArray: [Grid.Cell] = []
                for y in 0..<cols
                {
                    rowArray.append(Grid.Cell(position: (x, y), state: CellState.Empty))
                }
                grid.append(rowArray)
            }
        }
    }

    
    
    }

    
}