//
//  Engine2.swift
//  Assignment2
//
//  Created by Summer on 7/5/16.
//  Copyright (c) 2016 Michelle. All rights reserved.
//


import UIKit

class Engine2: UIViewController {
    
    class func neighbors(row: Int, col: Int) -> [(Int, Int)]
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
}
