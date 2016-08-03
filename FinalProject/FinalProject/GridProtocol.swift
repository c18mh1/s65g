//
//  GridProtocol.swift
//  FinalProject
//
//  Created by Michelle.
//  Copyright © 2016 Michelle. All rights reserved.
//

import Foundation

protocol GridProtocol
{
    init(rows: Int, cols: Int)
    var rows: Int {get}
    var cols: Int {get}
    func neighbors (position: Grid.Position) -> [Grid.Position]
    subscript(position: Grid.Position) -> CellState {get set}
}