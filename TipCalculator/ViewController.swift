//
//  ViewController.swift
//  TipCalculator
//
//  Created by Hengyi Yu on 7/13/20.
//  Copyright © 2020 Hengyi Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billAmount: UITextField!
    
    @IBOutlet weak var tipAmount: UILabel!
    
    @IBOutlet weak var splitControl: UISegmentedControl!
    @IBOutlet weak var tipPercent: UISegmentedControl!
    @IBOutlet weak var totalAmount: UILabel!
    var tipIndex = -1
    var splitIndex = -1
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        splitControl.selectedSegmentIndex = defaults.integer(forKey: "split")
        tipPercent.selectedSegmentIndex = defaults.integer(forKey: "tip")
        print(defaults.integer(forKey: "split"))
        print(defaults.integer(forKey: "tip"))
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }

    
    @IBAction func calTip(_ sender: Any) {
        var amount = Double(billAmount.text!) ?? 0
        let percent = [0.15, 0.18, 0.2]
        let split = [1, 2, 3]
        tipIndex = tipPercent.selectedSegmentIndex
        splitIndex = splitControl.selectedSegmentIndex
        var tip = percent[tipIndex] * amount
        tip /= Double(split[splitIndex])
        amount /= Double(split[splitControl.selectedSegmentIndex])
        tipAmount.text = String(format: "%.2f", tip)
        totalAmount.text = String(format: "%.2f", tip + amount)
        
    }
    func setDefaultValue(tipI: Int, splitI: Int) {
        tipIndex = tipI
        splitIndex = splitI
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
