//
//  GridProtocol.swift
//  Assignment4
//
//  Created by Michelle on 7/14/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import Foundation

protocol GridProtocol
{
    init(rows: Int, cols: Int)
    var rows: Int {get}
    var cols: Int {get}
    func neighbors (row: Int, col: Int) -> [(Int, Int)]
    subscript(row: Int, column: Int) -> CellState? {get set}
}



    