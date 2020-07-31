//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Aidan Delfuoco on 7/28/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billField.becomeFirstResponder()
        
        // load bill amount
        let defaults = UserDefaults.standard
        let billAmount = defaults.integer(forKey: "billAmount")
        if billAmount != 0 {
            billField.text = String(billAmount)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let defaultTip = defaults.integer(forKey: "defaultTip")
        tipControl.selectedSegmentIndex = defaultTip
    }
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        // calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // set up currency formatter
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        // update the tip and total labels
        tipLabel.text = currencyFormatter.string(for: tip)
        totalLabel.text = currencyFormatter.string(for: total)
        
        // save the bill amount to memory
        let defaults = UserDefaults.standard
        
        defaults.set(bill, forKey: "billAmount")
        defaults.synchronize()
    }
    
}

