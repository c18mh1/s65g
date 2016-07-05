//
//  Problem2ViewController.swift
//  
//
//  Created by Michelle on 6/30/16.
//
//

import UIKit

class Problem2ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var myButton: UIButton!
    
    @IBAction func buttonClicked(sender: AnyObject) {
        
        print("We were clicked")
        
        //randomly generates a state
        func returnState() -> Bool
        {
            var state:Bool = true;
            var x:Int = Int(arc4random_uniform(UInt32(2)))
            if (x == 0)
            {
                //0 = dead
                state = false;
            }
            else if (x == 1)
            {
                //1 = alive
                state = true;
            }
            
            return state
        }
        
        //2d arrays
        //help from:http://stackoverflow.com/questions/28891878/how-to-declare-a-multidimensional-boolean-array-in-swift
        var before = Array(count:10, repeatedValue:Array(count:10, repeatedValue:returnState()))
        var after = Array(count:10, repeatedValue:Array(count:10, repeatedValue:returnState()))

        
        //count number of living cells
        //help from: http://www.dotnetperls.com/2d-swift
        
        var aliveCount: Int = 0;
        for var i = 0; i <= before.count - 1; i++
        {
            for var j = 0; j <= before[i].count - 1; j++
            {
                if (before[i][j] == true)
                {
                    aliveCount = aliveCount + 1;
                    textView.text = "There are \(aliveCount) live cells in 'before'."
                }
            }
        }
        
        //loop over the before 2D array and count the living neighbors of each cell using a switch statement, observing the wrapping rules.
        //help from: http://beginwithjava.blogspot.com/2012/05/javas-modulo-function-wrapping-around.html
        func returnNeighbors(x: Int, y: Int) -> Int
        {
            var aliveNeighbors: Int = 0;
                
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
        
        
        
        //Place the result of applying the rules above into the corresponding cell in the "after" 2D array.
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
                    before[x][y] = after[x][y]
                    
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
                            before[x][y] = after[x][y]
                    
                            }
                    } //else if
                }
            }
        
        //Count and print the number of living cells in after to the UITextView
        var livingAfter:Int = 0;
        for var x = 0; x <= after.count-1; x++
        {
            for var y = 0; y <= after[x].count-1; y++
            {
                if (after[x][y] == true)
                {
                    livingAfter = livingAfter + 1
                    textView.text = "There are \(livingAfter) live cells in 'after'."
                }
            }
        }
        

       //PROBLEM 3: (commented out to let other code run)
       //Engine.step(before);
     
        
        
        //PROBLEM 4: function placed in Engine2.swift
 
        /*
        func step2(before: [[Bool]]) -> [[Bool]] //repeat problem 2 (take in array, return array) invoking neighbors
        {
            var after: [[Bool]] = []
            
            for var x = 0; x <= before.count-1; x++
            {
                for var y = 0; y <= before[x].count-1; y++
                {
                    //invoking neighbors function
                    Engine2.neighbors(x, col: y)
                    var neighborArray: [(Int, Int)] = Engine2.neighbors(x, col:y)
                    
                    //loop through neighbors function
                    for i in 0..<neighborArray.count
                    {
                        //get coordinates to each neighbor coordinate in the tuple array
                        var xcor = neighborArray[i].0
                        var ycor = neighborArray[i].1
                        
                        var live = 0;
                        
                    //count how many neighbors in neighbor array are alive
                       if ( before[xcor][ycor] == true )
                       {
                         live = live + 1
                        }
                        
                        //if cell is alive
                        if(before[x][y] == true)
                        {
                            
                            switch before[x][y]
                                
                            {
                                
                            case live<2: //Any live cell with fewer than two live neighbors dies or stays
                                after[x][y] = false;
                                
                            case (live == 2 || live == 3): //Any live cell with two or three live neighbors lives
                                after[x][y] = true;
                                
                            case live>3: //Any live cell with more than three live neighbors dies
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
                                
                            case live == 3: //any dead cell with exactly three live neighbors becomes a live cell
                                after[x][y] = true;
                                
                            default:
                                var m: Bool = before[x][y]
                                after[x][y] = m
                                
                            }
                        } //else if
                        
                    }
                }
            }
            
            return after
        }
        
        */

    } //closes buttonClicked
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Problem 2"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
