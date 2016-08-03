//
//  ConfigurationsViewController.swift
//  FinalProject
//
//  Created by Michelle.
//  Copyright © 2016 Michelle. All rights reserved.
//

import UIKit

class InstrumentationViewController: UITableViewController {

    var configurations : [GridConfiguration] = []
    
    @IBOutlet weak var rowStepper: UIStepper!
    @IBOutlet weak var columnStepper: UIStepper!
    @IBOutlet weak var rowsText: UITextField!
    @IBOutlet weak var columnsText: UITextField!
    @IBOutlet weak var refreshSlider: UISlider!
    @IBOutlet weak var refreshLabel: UILabel!
    @IBOutlet weak var timerSwitch: UISwitch!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var urlText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        fetch(NSURL(string: "https://dl.dropboxusercontent.com/u/7544475/S65g.json")!)

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //When user clicks a row, display the grid in the GridEditor ViewController
    //http://www.codingexplorer.com/segue-uitableviewcell-taps-swift/
    let segueIdentifier = "GridEditorSegue"
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == segueIdentifier,
        let _ = segue.destinationViewController as? GridEditorViewController,
        cellRow = tableView.indexPathForSelectedRow?.row
        {
            let selectedPoints = configurations[cellRow].points
            GridView().points = selectedPoints
        }
    }

    //from section and lecture 9
    func fetch(url: NSURL = NSURL(string: "https://dl.dropboxusercontent.com/u/7544475/S65g.json")!)
    {
        let fetcher = Fetcher()
        
        fetcher.requestJSON(url) { (json, message) in
            
            if let json = json
            {
                let correctType = json as! [AnyObject]
                let parser = GridConfigurationParser(configurations: correctType)
                self.configurations = parser.parse()!
            }
            let op = NSBlockOperation
                {
                    self.tableView.reloadData() 
            }
            NSOperationQueue.mainQueue().addOperation(op)
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return configurations.count
    }
    
    
    //section and http://www.kaleidosblog.com/swift-uitableview-load-data-from-json
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Identifier", forIndexPath: indexPath)
        cell.textLabel?.text = configurations[indexPath.row].title
        return cell
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    
    //http://www.kaleidosblog.com/swift-uitableview-load-data-from-json
    func refreshTableView()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            return
        })
    }
    
    
    //allow user to enter a URL
    @IBAction func urlEntered(sender: AnyObject)
    {
        urlText.text = "URL: \(urlText.text)"
        fetch(NSURL(string: urlText.text!)!)
    }
    
    
    //add row when plus button is clicked
    //http://stackoverflow.com/questions/31870206/how-to-insert-new-cell-into-uitableview-in-swift
    @IBAction func plusButtonClicked(sender: AnyObject)
    {
        tableView.beginUpdates()
        tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: configurations.count, inSection: 0)],
                                         withRowAnimation: .Automatic)
        tableView.endUpdates()
        tableView.reloadData()
        
    }
    
    
    //empty the table view and reload from the internet
    @IBAction func buttonPressed(sender: AnyObject)
    {
        configurations.removeAll()
        tableView.reloadData()
        fetch(NSURL(string: urlText.text!)!)
    }

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
        StandardEngine.EngineSingleton.rows = Int(rowStepper.value)
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
    


}
