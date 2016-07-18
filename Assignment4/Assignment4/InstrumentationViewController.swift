//
//  FirstViewController.swift
//  Assignment4
//
//  Created by Michelle on 7/13/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import UIKit

class InstrumentationViewController: UIViewController {

    @IBOutlet weak var rowStepper: UIStepper!
    @IBOutlet weak var columnStepper: UIStepper!
    @IBOutlet weak var rowsText: UITextField!
    @IBOutlet weak var columnsText: UITextField!
    @IBOutlet weak var refreshSlider: UISlider!
    @IBOutlet weak var refreshLabel: UILabel!
    @IBOutlet weak var timerSwitch: UISwitch!
    @IBOutlet weak var timerLabel: UILabel!
    
    //http://www.dotnetperls.com/uiswitch-swift
    @IBAction func timerSwitched(sender: AnyObject)
    {
        let on = timerSwitch.on
        
        if on
        {
            timerLabel.text = "Timer is on"
        }
        
        else
        {
            
            let standardEngine = StandardEngine(rows: 10, cols: 10)
            var timer = standardEngine.refreshTimer
            timer = nil;
            timerLabel.text = "Time is off/\(timer)"
        }
    }
    
    //http://www.ioscreator.com/tutorials/uislider-tutorial-ios8-swift
    @IBAction func changeRefreshRate(sender: AnyObject)
    {
        let standardEngine = StandardEngine(rows: 10, cols: 10)
        var rate = standardEngine.refreshRate
        rate = Double(refreshSlider.value)
        refreshLabel.text = "Refresh Rate: \(rate)"

    }
    
    
    //http://sourcefreeze.com/uistepper-example-in-swift/
    @IBAction func changeRow(sender: AnyObject)
    {
        //changes the value of rows to what the user inputs on the stepper
        let gridClass = Grid(rows: 10, cols: 10)
        var gridRows = gridClass.rows
        gridRows = Int(rowStepper.value)
        
        rowsText.text = "Rows: \(gridRows)"
    }
    
    
    @IBAction func changeColumn(sender: AnyObject)
    {
        //changes the value of columns to what the user inputs on the stepper
        let gridClass = Grid(rows: 10, cols: 10)
        var gridColumns = gridClass.cols
        gridColumns = Int(columnStepper.value)
        
        columnsText.text = "Columns: \(gridColumns)"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //http://www.ioscreator.com/tutorials/uistepper-tutorial-ios8-swift
        rowStepper.wraps = true
        rowStepper.autorepeat = true
    
        columnStepper.wraps = true
        columnStepper.autorepeat = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var oneValue: UITextField!
    
    @IBAction func oneClicker(sender: UIStepper) {
        self.oneValue.text = Int(sender.value).description
    }
    
}

