//
//  setting.swift
//  TipCalculator
//
//  Created by Hengyi Yu on 7/14/20.
//  Copyright © 2020 Hengyi Yu. All rights reserved.
//

import Foundation
import UIKit



class SettingViewController: UIViewController {
    @IBOutlet weak var tipSetter: UISegmentedControl!
    @IBOutlet weak var splitSetter: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        splitSetter.selectedSegmentIndex = defaults.integer(forKey: "split")
        tipSetter.selectedSegmentIndex = defaults.integer(forKey: "tip")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipDefaultChange(_ sender: Any) {
        defaults.set(tipSetter.selectedSegmentIndex, forKey:  "tip")
    }
    @IBAction func splitDefaultChange(_ sender: Any) {
        defaults.set(splitSetter.selectedSegmentIndex, forKey: "split")
    }
    
}
