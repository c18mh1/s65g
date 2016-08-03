//
//  EngineProtocol.swift
//  FinalProject
//
//  Created by Michelle.
//  Copyright © 2016 Michelle. All rights reserved.
//

import Foundation

protocol EngineProtocol
{
    var delegate: EngineDelegate? {get set}
    var grid: GridProtocol {get}
    var refreshRate: Double {get set}
    var refreshTimer: NSTimer? {get set}
    var rows: Int {get set}
    var cols: Int {get set}
    init(rows: Int, cols: Int)
    func step(before: [Grid.Cell]) -> [Grid.Cell]
}

//default refreshRate to zero
extension EngineProtocol
{
    var refreshRate: Double
    {
        return 0.0
    }
}
