//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Gülzade Karataş on 9.01.2025.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var calculatorLabel: UILabel!
    
    var currentValue: String = "0" // Current value displayed on screen
    var previousValue: Double = 0
    var currentOperation: String? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        //Get the tag value of the button
        let buttonTag = sender.tag
        if currentValue == "0" {
            currentValue = String(buttonTag)
        }else{
            currentValue += String(buttonTag)
        }
        //Show the result on the calculator label
        calculatorLabel.text = currentValue
    }
    
    
    
    @IBAction func operationPressed(_ sender: UIButton) {
    }
    
    
    
    
    @IBAction func equalButton(_ sender: UIButton) {
    }
    
    
    @IBAction func clearButton(_ sender: UIButton) {
        currentValue = "0"
        calculatorLabel.text = currentValue
        previousValue = 0
        currentOperation = nil
    }
    
    @IBAction func percentButton(_ sender: UIButton) {
    }
    
    @IBAction func signChangeButton(_ sender: UIButton) {
    }
    
    
}

