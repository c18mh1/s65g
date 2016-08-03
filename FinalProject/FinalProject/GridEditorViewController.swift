//
//  GridEditorViewController.swift
//  FinalProject
//
//  Created by Michelle.
//  Copyright © 2016 Michelle. All rights reserved.
//

import UIKit

class GridEditorViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //from lecture 9
    var commit: (GridView -> Void)?
    
    @IBOutlet weak var gridEditorGrid: UIView!
    
    //save button
    @IBAction func saveButtonPressed(sender: AnyObject)
    {
        guard let editedGrid = gridEditorGrid, commit = commit
            else { return }
        commit(editedGrid as! GridView)
        navigationController!.popViewControllerAnimated(true)

    }

}
