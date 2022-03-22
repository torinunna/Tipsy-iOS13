//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tip = 0.10
    var number = 2
    var billTotal = 0.0
    var finalResult = "0.0"

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let selectedTip = sender.currentTitle!
        let tipAmount = String(selectedTip.dropLast())
        let tipValue = Double(tipAmount)
        tip = tipValue! / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        number = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
      
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * ( 1 + tip) / Double(number)
            finalResult = String(format: "%.2f", result)
            print(finalResult)
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    

}

