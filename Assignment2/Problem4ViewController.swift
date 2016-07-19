//
//  Problem4ViewController.swift
//  
//
//  Created by Michelle on 6/30/16.
//
//

import UIKit

class Problem4ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var myButton: UIButton!
    
    @IBAction func buttonClicked(sender: AnyObject) {
        
        print("We were clicked", terminator: "")
        textView.text = "Button was clicked."
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Problem 4"

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
