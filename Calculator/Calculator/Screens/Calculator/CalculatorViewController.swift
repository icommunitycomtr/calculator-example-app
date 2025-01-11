//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Gülzade Karataş on 9.01.2025.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var calculatorLabel: UILabel!
    
    var currentValue: String = "0"
    var previousValue: Double = 0
    var currentOperation: String? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if currentValue == "0" {
            currentValue = sender.titleLabel?.text ?? "0"
        }else{
            currentValue += sender.titleLabel?.text ?? ""
        }
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

