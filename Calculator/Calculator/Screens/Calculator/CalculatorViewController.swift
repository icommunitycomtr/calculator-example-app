//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Gülzade Karataş on 9.01.2025.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var calculatorLabel: UILabel!
    
    enum operationType: Int {
        case addition = 100,
             subtraction,
             multiplication,
             division
    }
    
    var currentValue: String = "0" // Current value displayed on screen
    var previousValue: Double = 0
    var currentOperation: operationType? = nil
    
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
        
        let operationTag = sender.tag
        //Return if an operation is selected result yet, to stop new operation
        if currentOperation != nil {
            return
        }
        previousValue = Double(currentValue) ?? 0
        
        //Set operation type with the tag value.
        if let operation = operationType(rawValue: operationTag) {
            switch operationType(rawValue: operationTag) {
            case .addition:
                currentOperation = .addition
            case .subtraction:
                currentOperation = .subtraction
            case .multiplication:
                currentOperation = .multiplication
            case .division:
                currentOperation = .division
            default:
                break
            }
        } else {
            print("Invalid operation tag!")
        }
        currentValue = "0"
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        let currentVal = Double(currentValue) ?? 0
        
        guard let operation = currentOperation else {
            return
        }
        
        switch operation {
        case .addition:
            currentValue = String(previousValue + currentVal)
        case .subtraction:
            currentValue = String(previousValue - currentVal)
        case .multiplication:
            currentValue = String(previousValue * currentVal)
        case .division:
            // division by zero
            if currentVal == 0 {
                let alert = UIAlertController(title: "Error", message: "Division by zero is not allowed", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                return
            }
            currentValue = String(previousValue / currentVal)
        }
        calculatorLabel.text = currentValue // show result on display
        currentOperation = nil // update 
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

