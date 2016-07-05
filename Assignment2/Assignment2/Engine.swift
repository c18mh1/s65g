//
//  Engine.swift
//  Assignment2
//
//  Created by Summer on 7/5/16.
//  Copyright (c) 2016 Michelle. All rights reserved.
//

import UIKit

class Engine: UIViewController {
    
    //takes in a 2d bool array, before, and returns a 2d array of bools, after. 
    class func step (before: [[Bool]]) -> [[Bool]]
    {
        var after: [[Bool]] = []
        
        func returnNeighbors(x: Int, y: Int) -> Int
        {
            var aliveNeighbors: Int = 0;
            
            var aliveCount: Int = 0;
            for var i = 0; i <= before.count - 1; i++
            {
                for var j = 0; j <= before[i].count - 1; j++
                {
                    if (before[i][j] == true)
                    {
                        aliveCount = aliveCount + 1;
                        
                    }
                }
            }
            
            switch before[x][y]
            {
                
                //(1,1)
            case before[(x+9)%10][(y+9)%10] == true:
                aliveNeighbors = aliveNeighbors + 1
                
                //(1,0)
            case before[(x+9)%10][(y+0)%10] == true:
                aliveNeighbors = aliveNeighbors + 1
                
                //(1,9)
            case before[(x+9)%10][(y+1)%10] == true:
                aliveNeighbors = aliveNeighbors + 1
                
                //(0,1)
            case before[x][(y+9)%10] == true:
                aliveNeighbors = aliveNeighbors + 1
                
                //(0,9)
            case before[x][(y+1%10)] == true:
                aliveNeighbors = aliveNeighbors + 1
                
                //(9,1)
            case before[(x+1)%10][(y+9)%10] == true:
                aliveNeighbors = aliveNeighbors + 1
                
                //(9,0)
            case before[(x+1)%10][y] == true:
                aliveNeighbors = aliveNeighbors + 1
                
                //(9,9)
            case before[(x+1)%10][(y+1)%10] == true:
                aliveNeighbors = aliveNeighbors + 1
                
            default:
                aliveNeighbors = aliveNeighbors + 0
            }
            return aliveNeighbors
        } //closes function
        
        
        for var x = 0; x <= before.count-1; x++
        {
            for var y = 0; y <= before[x].count-1; y++
            {
                var neighbors: Int = returnNeighbors(x,y)
                
                //if cell is alive
                if(before[x][y] == true)
                {
                    
                    switch before[x][y]
                        
                    {
                        
                    case neighbors<2: //Any live cell with fewer than two live neighbors dies or stays
                        after[x][y] = false;
                        
                    case (neighbors == 2 || neighbors == 3): //Any live cell with two or three live neighbors lives
                        after[x][y] = true;
                        
                    case neighbors>3: //Any live cell with more than three live neighbors dies
                        after[x][y] = false;
                        
                    default:
                        var m: Bool = before[x][y]
                         after[x][y] = m
                        
                    } //switch
                    
                } //if statement
                    
                    //if cell is dead
                else if (before[x][y] == false)
                {
                    switch before[x][y]
                    {
                        
                    case neighbors == 3: //any dead cell with exactly three live neighbors becomes a live cell
                        after[x][y] = true;
                        
                    default:
                        var m: Bool = before[x][y]
                        after[x][y] = m
                        
                    }
                } //else if
            }
        }
        
        var livingAfter:Int = 0;
        for var x = 0; x <= after.count-1; x++
        {
            for var y = 0; y <= after[x].count-1; y++
            {
                if (after[x][y] == true)
                {
                    livingAfter = livingAfter + 1
                }
            }
        }
        

        return after
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
}
