//
//  CellState.swift
//  Assignment4
//
//  Created by Michelle on 7/14/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import Foundation
import UIKit


enum CellState: String
{
    case Living = "Living"
    case Empty = "Empty"
    case Born = "Born"
    case Died = "Died"
    
    var description : String
    {
        return self.rawValue
    }
    
    func toggle(value: CellState) -> CellState
    {
        switch value
        {
        case .Empty:
            return .Living
            
        case .Died:
            return .Living
            
        case .Living:
            return .Empty
            
        case .Born:
            return .Empty
        }
    }

    
}

