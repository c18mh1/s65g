//
//  SimulationViewController.swift
//  FinalProject
//
//  Created by Michelle.
//  Copyright © 2016 Michelle. All rights reserved.
//

import UIKit

class SimulationViewController: UIViewController, EngineDelegate {

    var grid = GridView().grid
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //set self as delegate of the StandardEngine singleton
        //http://stackoverflow.com/questions/29536080/swift-set-delegate-for-singleton
        
        StandardEngine.EngineSingleton.delegate = self
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func engineDidUpdate( withGrid: GridProtocol)
        {
            weak var gridView: GridView!
            _ = gridView.grid as! GridProtocol
            gridView.setNeedsDisplay()
        }
    
    

    @IBAction func resetButtonPressed(sender: AnyObject)
    {
        weak var gridView: GridView!
        _ = gridView.grid as! GridProtocol
        gridView.setNeedsDisplay()
        
        NSNotificationCenter.defaultCenter().postNotificationName("ResetButtonPressed", object: nil)
    }
    
    //from lecture 12
    //http://sourcefreeze.com/uialertcontroller-ios-8-using-swift/
    var nameTextField: UITextField?
    @IBAction func saveButtonPressed(sender: AnyObject)
    {
        let alert = UIAlertController(title: "Save", message: "Please enter a name for this configuration.",
                                      preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default) { _ in})
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default) { _ in})
        alert.addTextFieldWithConfigurationHandler
            { (textField) -> Void in
                self.nameTextField = textField
                self.nameTextField?.placeholder = "Enter a name"
        }
        
        var newConfiguration: GridConfiguration = GridConfiguration(title: "DefaultTitle", points: [(1, 1)])
        let gridFlat = grid.flatMap({$0})
        newConfiguration.title = nameTextField!.text!
        newConfiguration.points = gridFlat.map({$0.position})
        InstrumentationViewController().configurations.append(newConfiguration)
        
        self.presentViewController(alert, animated: true) {}
    }


}
