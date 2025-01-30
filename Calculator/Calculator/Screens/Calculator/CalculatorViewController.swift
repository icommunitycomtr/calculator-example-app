//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Gülzade Karataş on 9.01.2025.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var calculatorLabel: UILabel!
    
    enum OperationType: Int {
        case addition = 100,
             subtraction,
             multiplication,
             division
    }
    
    var currentValue: String = "0" // Current value displayed on screen
    var previousValue: Double = 0
    var currentOperation: OperationType? = nil
    
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
    
    @IBAction func comaButton(_ sender: UIButton) {
        if !currentValue.contains(".") {
            currentValue += "."
        }
        calculatorLabel.text = currentValue
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        
        let operationTag = sender.tag
        //Return if an operation is selected result yet, to stop new operation
        if currentOperation != nil {
            return
        }
        previousValue = Double(currentValue) ?? 0
        
        //Set operation type with the tag value
        if let operation = OperationType(rawValue: operationTag) {
            currentOperation = operation
        }else {
            print("Invalid operation tag!")
        }
        currentValue = "0"
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        let currentVal = Double(currentValue) ?? 0
        
        guard let operation = currentOperation else {
            return
        }
        var result: Double = 0
        switch operation {
        case .addition:
            result = previousValue + currentVal
        case .subtraction:
            result = previousValue - currentVal
        case .multiplication:
            result = previousValue * currentVal
        case .division:
            // division by zero
            if currentVal == 0 {
                let alert = UIAlertController(title: "Error", message: "Division by zero is not allowed", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                return
            }
            result = previousValue / currentVal
        }
        
        currentValue = result.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(result)) : String(format: "%.2f", result)
        
        calculatorLabel.text = currentValue // show result on display
        currentOperation = nil // update currentOperation
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        currentValue = "0"
        calculatorLabel.text = currentValue
        previousValue = 0
        currentOperation = nil
    }
    
    @IBAction func percentButton(_ sender: UIButton) {
        let currenVal = Double(currentValue) ?? 0
        currentValue = String(currenVal / 100)
        calculatorLabel.text = currentValue
    }
    
    @IBAction func signChangeButton(_ sender: UIButton) {
        let currenVal = Double(currentValue) ?? 0
        currentValue = String(currenVal * -1)
        calculatorLabel.text = currentValue
    }
}

