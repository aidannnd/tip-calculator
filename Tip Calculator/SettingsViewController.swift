//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Aidan Delfuoco on 7/30/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        // load selectedSegmentIndex
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let defaultTip = defaults.integer(forKey: "defaultTip")
        segmentedControl.selectedSegmentIndex = defaultTip
    }

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    @IBAction func tipControl(_ sender: Any) {
        // save selectedSegmentIndex
        let defaultTip = segmentedControl.selectedSegmentIndex

        let defaults = UserDefaults.standard

        defaults.set(defaultTip, forKey: "defaultTip")
        defaults.synchronize()
    }

}
