//
//  ViewController.swift
//  tips
//
//  Created by siadneva on 1/9/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var bill: UIImageView!
    @IBOutlet weak var tip: UIImageView!
    @IBOutlet weak var equal: UIImageView!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        self.bill.alpha = 0
        self.tip.alpha = 0
        self.equal.alpha = 0
        
        UIImageView.animateWithDuration(0.4, animations: {
            self.bill.alpha = 1
            self.tip.alpha = 1
            self.equal.alpha = 1
            
        })
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

