//
//  InstrumentationViewController.swift
//  FinalProject
//
//  Created by Michelle on 7/26/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import UIKit

class InstrumentationViewController: UIViewController{
    
    @IBOutlet weak var rowStepper: UIStepper!
    @IBOutlet weak var columnStepper: UIStepper!
    @IBOutlet weak var rowsText: UITextField!
    @IBOutlet weak var columnsText: UITextField!
    @IBOutlet weak var refreshSlider: UISlider!
    @IBOutlet weak var refreshLabel: UILabel!
    @IBOutlet weak var timerSwitch: UISwitch!
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //http://www.ioscreator.com/tutorials/uistepper-tutorial-ios8-swift
        rowStepper.wraps = true
        rowStepper.autorepeat = true
        
        columnStepper.wraps = true
        columnStepper.autorepeat = true
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    /*
    //look at tutorial of table view
    //http://stackoverflow.com/questions/26652819/trigger-an-action-when-an-user-clicks-on-a-cell-in-swift
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        GridView.grid.points = configurations[indexPath.row].points
        GridView.grid.setNeedsDisplay()
    }
    
    */
    
    //MARK: INSTRUMENTATION TAB ELEMENTS:
        
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
            
            StandardEngine.EngineSingleton.refreshTimer = nil;
            timerLabel.text = "Time is off/\(StandardEngine.EngineSingleton.refreshTimer)"
        }
    }

    
    //http://www.ioscreator.com/tutorials/uislider-tutorial-ios8-swift
    @IBAction func changeRefreshRate(sender: AnyObject)
    {
        StandardEngine.EngineSingleton.refreshRate = Double(refreshSlider.value)
        refreshLabel.text = "Refresh Rate: \(Double(refreshSlider.value))"
        
    }
    
    
    //http://sourcefreeze.com/uistepper-example-in-swift/
    @IBAction func changeRow(sender: AnyObject)
    {
        //changes the value of rows to what the user inputs on the stepper
        
        //singleton, set rows in singleton,
      //  StandardEngine.EngineSingleton.grid.rows = Int(rowStepper.value)
        
        rowsText.text = "Rows: \(Int(rowStepper.value))"
    }
    
    @IBAction func changeColumn(sender: AnyObject)
    {
        //changes the value of columns to what the user inputs on the stepper
        StandardEngine.EngineSingleton.cols = Int(columnStepper.value)
        
        columnsText.text = "Columns: \(Int(columnStepper.value))"
        
    }
    
    @IBOutlet weak var oneValue: UITextField!
    @IBAction func oneClicker(sender: UIStepper)
    {
        self.oneValue.text = Int(sender.value).description
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}//class
