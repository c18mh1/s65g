//
//  ViewController.swift
//  Assignment3
//
//  Created by Michelle on 7/17/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var gridView: GridView!
    
    func neighbors(row: Int, column: Int) -> [(Int, Int)]
    {
        var neighbors: [(Int, Int)] = []
        
        let a: (Int, Int) = ((row+9)%10, (column+9)%10)
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

    func step (before: [[ViewController.CellState]]) -> [[ViewController.CellState]]
    {
        var after: [[ViewController.CellState]] = [[]]
        
        for x in 0..<before.count
        {
            for y in 0..<before[x].count
            {
                var neighborArray: [(Int, Int)] = neighbors(x, column: y)
                
                for i in 0..<neighborArray.count
                {
                    let xcor = neighborArray[i].0
                    let ycor = neighborArray[i].1
                    
                    var live = 0;
                    
                    //count alive neighbors
                    if(before[xcor][ycor] == .Living)
                    {
                        live = live + 1
                    }
                    
                    //if alive
                    if(before[x][y] == .Living)
                    {
                        if(live<2)
                        {
                            after[x][y] = .Died
                        }
                        
                        else if (live == 2 || live==3)
                        {
                            after[x][y] = .Born
                        }
                        
                        else if (live>3)
                        {
                            after[x][y] = .Died
                        }
                    }//if alive
                    
                    else if (before[x][y] == .Empty)
                    {
                        if (live == 3)
                        {
                            after[x][y] = .Born
                        }
                    }
                }
            }
        }
        
        return after
    } //step
    
    //button action 
    @IBAction func buttonPressed(sender: AnyObject)
    {
        let gridViewClass = GridView()
        let gridToBeStepped = gridViewClass.grid
        step(gridToBeStepped)
        gridView.setNeedsDisplay()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    enum CellState: String
    {
        case Living = "Living"
        case Empty = "Empty"
        case Born = "Born"
        case Died = "Died"
        
        static func description (state: CellState) -> String
        {
            switch state
            {
            case .Living:
                return Living.rawValue
                
            case .Empty:
                return Empty.rawValue
                
            case .Born:
                return Born.rawValue
                
            case .Died:
                return Died.rawValue
            
            }
        }
        
        func allValues () -> [CellState]
        {
            return [.Living, .Empty, .Born, .Died]
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
    
    
}//class

