//
//  ViewController.swift
//  Assignment3
//
//  Created by Summer on 7/8/16.
//  Copyright (c) 2016 Michelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gridView: GridView!
    
    func neighbors(row: Int, col: Int) -> [(Int, Int)]
    {
        var neighbors: [(Int, Int)] = []
        
        neighbors.append(((row+9)%10), ((col+9)%10)) //(1,1)
        neighbors.append((row%10), ((col+9)%10)) //(1,0)
        neighbors.append(((row+1)%10), ((col+9)%10)) //(1,9)
        neighbors.append(((row+9)%10), (col%10)) //(0,1)
        neighbors.append(((row+1)%10), (col%10)) //(0,9)
        neighbors.append(((row+9)%10), ((col+1)%10))//(9,1)
        neighbors.append((row%10), ((col+1)%10))//(9,0)
        neighbors.append(((row+1)%10), ((col+1)%10))//(9,9)
        
        return neighbors;
        
    }
    
    func step (before: [[ViewController.CellState]]) -> [[ViewController.CellState]]
    {
        var after: [[ViewController.CellState]] = [[]]
        
        for var x = 0; x <= before.count-1; x++
        {
            for var y = 0; y <= before[x].count-1; y++
            {
                //invoking neighbors function
                neighbors(x, col: y)
                var neighborArray: [(Int, Int)] = neighbors(x, col:y)
                
                //loop through neighbors function
                for i in 0..<neighborArray.count
                {
                    //get coordinates to each neighbor coordinate in the tuple array
                    var xcor = neighborArray[i].0
                    var ycor = neighborArray[i].1
                    
                    var live = 0;
                    
                    //count how many neighbors in neighbor array are alive
                    if (before[xcor][ycor] == .Living )
                    {
                        live = live + 1
                    }
                    
                    //if cell is alive
                    if(before[x][y] == .Living)
                    {
                        if (live < 2)
                        {
                            after[x][y] = .Died
                        }
                       
                        else if (live == 2 || live==3)
                        {
                            after[x][y] = .Born
                        }
                        else if (live>3)
                        {
                            after[x][y] = .Died;
                        }
                        
                    } //if alive
                        
                    //if cell is dead
                    else if (before[x][y] == .Empty)
                    {
                        if (live == 3)
                        {
                            after[x][y] = .Born
                        }

                    } //else if
                    
                }
            }
        }
 
        return after
    }
    
    @IBAction func buttonPressed(sender: AnyObject)
    {
        
      step(grid)
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
        
        //equip the enum with a description method which uses a switch statement to hand back the raw value
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
                
                default:
                print()
                
            }
        }
        
        
        //equip the enum with an allValues method which returns an array of all available values for the enum
        func allValues () -> [CellState]
        {
             return [.Living, .Empty, .Born, .Died]
        }
        
        
        //equip the enum with a method toggle(value:CellState)-> CellState which when passed .Empty or .Died, returns .Living, when passed .Living or .Born returns .Empty
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
}

