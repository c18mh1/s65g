//
//  GridView.swift
//  Assignment4
//
//  Created by Michelle on 7/15/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import Foundation
import UIKit

let π: CGFloat = CGFloat(M_PI)
@IBDesignable

class GridView: UIView
    
{
    var grid: [[CellState]] = [[]]
    
    @IBInspectable var rows: Int = 10
        {
            didSet
            {
                grid = []
                for _ in 0..<rows
                {
                    var rowArray: [CellState] = []
                    for _ in 0..<cols
                    {
                        rowArray.append(CellState.Empty)
                    }
                    grid.append(rowArray)
                }
            }
        }
    
    @IBInspectable var cols: Int = 10
    
    @IBInspectable var gridWidth: CGFloat = 0.0
    @IBInspectable var livingColor: UIColor = UIColor.blueColor()
    @IBInspectable var emptyColor: UIColor = UIColor.grayColor()
    @IBInspectable var bornColor: UIColor = UIColor.redColor()
    @IBInspectable var diedColor: UIColor = UIColor.blackColor()
    @IBInspectable var gridColor: UIColor = UIColor.whiteColor()
    
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
            let path = UIBezierPath();
            path.lineWidth = gridWidth;
            
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

    
    }//draw rect
    
    
    
}//class
