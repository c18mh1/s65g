//
//  GridView.swift
//  Assignment3
//
//  Created by Michelle on 7/17/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import UIKit

let π: CGFloat = CGFloat(M_PI)

@IBDesignable

class GridView: UIView {

    var grid: [[ViewController.CellState]] = [[]]

    @IBInspectable var rows: Int = 20
        {
            didSet
            {
                grid = []
                for _ in 0..<rows{
                    var rowArray: [ViewController.CellState] = []
                    for _ in 0..<cols{
                        rowArray.append(ViewController.CellState.Empty)
                    }
                    grid.append(rowArray)
                }
            }
        }
    
    @IBInspectable var cols: Int = 20
    
    @IBInspectable var gridWidth: CGFloat = 0.0
    @IBInspectable var livingColor: UIColor = UIColor.blueColor()
    @IBInspectable var emptyColor: UIColor = UIColor.grayColor()
    @IBInspectable var bornColor: UIColor = UIColor.redColor()
    @IBInspectable var diedColor: UIColor = UIColor.blackColor()
    @IBInspectable var gridColor: UIColor =  UIColor.whiteColor()
    

    override func drawRect(rect: CGRect)
    {
    
        let context = UIGraphicsGetCurrentContext()
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        
        let rectangle = CGRectMake(0, 0, bounds.width, bounds.height)
        CGContextAddRect(context, rectangle)
        CGContextSetLineWidth(context, gridWidth)
        CGContextStrokePath(context)
        
        var cellWidth: CGFloat
        {
            get
            {
                return (bounds.width)/CGFloat(cols)
            }
        }
        
        
        var cellHeight: CGFloat
        {
            get
            {
                return (bounds.height)/CGFloat(rows)
            }
        }
        
        
        func drawColumns(x: Double, y: Double)
        {
            let path = UIBezierPath()
            path.lineWidth = gridWidth
            
            path.moveToPoint(CGPoint(x: CGFloat(x) + cellWidth, y: 0))
            path.addLineToPoint(CGPoint(x: CGFloat(x) + cellWidth, y: bounds.height))
            gridColor.setStroke()
            path.stroke()
        }
        
        func drawRows(x: Double, y: Double)
        {
            let path = UIBezierPath();
            path.lineWidth = gridWidth;
            
            path.moveToPoint(CGPoint(x: 0, y: CGFloat(y) + cellHeight))
            path.addLineToPoint(CGPoint(x: bounds.width, y: CGFloat(y) + cellHeight))
            gridColor.setStroke()
            path.stroke()
        }
        
        //draw columns
        for col in 0..<cols
        {
            let y: Double = 0
            let x = CGFloat(col)*cellWidth
            drawColumns(Double(x), y: y)
        }
        
        //draw rows
        for row in 0..<rows
        {
            let x: Double = 0
            let y = CGFloat(row)*cellHeight
            drawRows(x, y: Double(y))
        }
        
        
        //draw circles
        
        for arrayColumn in 0 ..< grid.count
        {
            for arrayRow in 0 ..< grid.count
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
                
                let center = findCenter(arrayColumn, arrayRow: arrayRow)
                let radius = findRadius()
                
                let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
                
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
        
        //touch handling
     
        var allPoints = [UITouch: [CGPoint]]()

        func touchesBegan (touches: Set<NSObject>, withEvent event: UIEvent)
        {
            //help from: http://stackoverflow.com/questions/29977830/getting-touch-coordinates-in-swift-1-2
                    print("touched")
            
            let touch = touches.first as! UITouch
            let location: CGPoint = touch.locationInView(self)
            
            let x = location.x
            let y = location.y
            
            let xCols = Int(x) * cols
            let yRows = Int(y) * rows
            
            let colNumber = floor(CGFloat(xCols)/bounds.width)
            let rowNumber = floor(CGFloat(yRows)/bounds.height)
            let col = Int(colNumber)
            let row = Int(rowNumber)
            
            let toggleThis = grid[col][row]
            _ = ViewController.CellState.toggle(toggleThis)
            
            let cell = CGRectMake(x, y, (bounds.width)/CGFloat(cols), (bounds.height)/CGFloat(rows))
            self.setNeedsDisplayInRect(cell)
        }
        
        func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent)
        {
            NSLog("touchesMoved")
        }
        
        func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent)
        {
            NSLog("touchesEnded")
        }
        
        func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!)
        {
            NSLog("touchesCancelled")
        }

        
    }//drawRect


}//class
