//
//  GridView.swift
//  
//
//  Created by Summer on 7/8/16.
//
//

import UIKit

let π:CGFloat = CGFloat(M_PI)

@IBDesignable

class GridView: UIView {
    
    //a 2-d array of CellState values called grid
    var grid: [[ViewController.CellState]] = [[]]
    
    // Integers: rows and cols (defaulting to 20 and 20, respectively)
    @IBInspectable var rows: Int = 20
        {
        didSet
        {
            grid = []
            for row in 0..<rows {
                var rowArray:[ViewController.CellState] = []
                for col in 0..<cols {
                    rowArray.append(ViewController.CellState.Empty)
                }
                grid.append(rowArray)
            }
        }
    }
    
    
    @IBInspectable var cols: Int = 20
        /*
    {
        didSet
        {
            grid = [[ViewController.CellState.Empty]] //grid reinitialized to all .Empty when cols changes using didSet
        }
    }
*/
    
    //CGFloat gridWidth
    @IBInspectable var gridWidth: CGFloat = 0.0;
    
    //4 UI Colors
    @IBInspectable var livingColor: UIColor = UIColor.blueColor();
    @IBInspectable var emptyColor: UIColor = UIColor.grayColor();
    @IBInspectable var bornColor: UIColor = UIColor.redColor();
    @IBInspectable var diedColor: UIColor = UIColor.blackColor();
    @IBInspectable var gridColor: UIColor = UIColor.whiteColor();
    
    //draws the correct set of grid lines in the view using the techniques shown in class.  Do not redraw the entire grid every time, only draw the part of the grid required by the passed-in rect and for set the gridlines to have width as specified in the gridWidth property and color as in gridColor
    
    
    // help from: http://www.techotopia.com/index.php/An_iOS_8_Swift_Graphics_Tutorial_using_Core_Graphics_and_Core_Image#Drawing_a_Rectangle
    override func drawRect (rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        
        let rectangle = CGRectMake(0, 0, bounds.width, bounds.height)
        CGContextAddRect(context, rectangle)
        CGContextSetLineWidth(context, gridWidth)
        CGContextStrokePath(context)
        

        var cellWidth: CGFloat
            {
            get
                
            {
             var strokes = cols - 1;
             return (bounds.width)/CGFloat(cols)
            
            }
            
        }
        
        var cellHeight: CGFloat
            {
            get
                
            {
               var lines = rows - 1
               return (bounds.height)/CGFloat(rows)
               
            }
        }
  
        func drawColumns(var x: Double, var y: Double)
        {

            var path = UIBezierPath();
            path.lineWidth = gridWidth;
            
            //move to start point
            path.moveToPoint(CGPoint(x: CGFloat(x) + cellWidth , y: 0))
            
            //end point
            path.addLineToPoint(CGPoint(x: CGFloat(x) + cellWidth, y: bounds.height))
            
            //set stroke color
            gridColor.setStroke()
            
            //draw line
            path.stroke()
     
        }
        
   
        func drawRows(var x: Double, var y: Double)
        {
            var path = UIBezierPath();
            path.lineWidth = gridWidth
            
            //move to start point
            path.moveToPoint(CGPoint(x: 0, y: CGFloat(y) + cellHeight));
            
            //end point
            path.addLineToPoint(CGPoint(x: bounds.width, y: CGFloat(y) + cellHeight))
           
            //set stroke color
            gridColor.setStroke()
            
            //draw line
            path.stroke()
        }
        
        
        //Draw Columns
        for col in 0..<cols
        {
            var y: Double = 0
            let x = CGFloat(col)*cellWidth
            drawColumns(Double(x), y)

        }
        
        //Draw Rows
        for row in 0..<rows
        {
            var x: Double = 0
            let y = CGFloat(row)*cellHeight
            drawRows(x, Double(y))
        }
        
        let cell = CGRectMake(0, 0, cellWidth, cellHeight)
        [self.setNeedsDisplayInRect(cell)]
        
        
        //Draw Circles
        for var arrayColumn = 0; arrayColumn < grid.count; arrayColumn++
        {
            for var arrayRow = 0; arrayRow < grid.count; arrayRow++
            {
                func findCenter (arrayColumn: Int, arrayRow: Int) -> CGPoint
                {
                    
                    var x = CGFloat(arrayColumn) * cellWidth
                    var y = CGFloat(arrayRow) * cellHeight
                    
                    x = (x + cellWidth/2)
                    y = (y + cellHeight/2)
                    
                    return CGPoint (x: x, y: y)
                    
                }
                
                func findRadius() -> CGFloat
                {
                    return min((cellWidth/2.0) - 1.0, (cellHeight/2.0) - 1.0)
                }
                
                let startAngle: CGFloat = 0
                let endAngle: CGFloat = 2 * π
                
                var center = findCenter(arrayColumn, arrayRow)
                var radius = findRadius()
                
                var path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle,
                    endAngle: endAngle, clockwise: true)
                
                switch grid[arrayColumn][arrayRow]
                {
                case .Living: livingColor.setFill()
                case .Born: bornColor.setFill()
                case .Died: diedColor.setFill()
                case .Empty: emptyColor.setFill()
                }
                
                path.fill()
                path.stroke()
            }
        }
    
    }//drawRect
    
    //Touch handling
    
    var allPoints = [UITouch: [CGPoint]]()
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        NSLog("touchesBegan");

        //http://stackoverflow.com/questions/29977830/getting-touch-coordinates-in-swift-1-2
        let touch = touches.first as! UITouch
        let location :CGPoint = touch.locationInView(self)
       
        var x = location.x
        var y = location.y
    
        var xCols = Int(x) * cols
        var yRows = Int(y) * rows
        
        var colNumber = floor(CGFloat(xCols)/bounds.width)
        var rowNumber = floor(CGFloat(yRows)/bounds.height)
        var col = Int(colNumber)
        var row = Int(rowNumber)
        
        var toggleThis = grid[col][row]
        var state = ViewController.CellState.toggle(toggleThis)
        grid[col][row] = state
    
        let cell = CGRectMake(x, y, (bounds.width)/CGFloat(cols), (bounds.height)/CGFloat(rows))
        self.setNeedsDisplayInRect(cell)
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        NSLog("touchesMoved");
        
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        NSLog("touchesEnded");
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        NSLog("touchesCancelled");
    }
    
}

