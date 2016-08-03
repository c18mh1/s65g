//
//  CellState.swift
//  FinalProject
//
//  Created by Michelle.
//  Copyright © 2016 Michelle. All rights reserved.
//

import Foundation
import UIKit


enum CellState
{
    case Living
    case Empty
    case Born
    case Died
    
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
    
    //from lecture 8 in class
    func isAlive () -> Bool
    {
        switch self
        {
        case .Living, .Born: return true
        case .Died, .Empty: return false
            
        }
    }

}
