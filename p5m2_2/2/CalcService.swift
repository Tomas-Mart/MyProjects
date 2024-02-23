//
//  CalcService.swift
//  2
//
//  Created by Amina TomasMart on 01.02.2024.
//

import Foundation

class CalcService {
    
    var isRunning = true
    var currentNum = "0"
    var tfLeft = 0.0
    var tfRight = 0.0
    var result = ""
    var currentOperation = Operations.noAction
    var displayView: ViewController
    
    init(displayView: ViewController) {
        self.displayView = displayView
    }
    
    // MARK: functions
    func updateDisplay(text: String) {
        print(text)
    }
    
    func makeCalculation(operation: Operations) {
        if currentOperation != .noAction {
            if currentNum != "" {
                tfRight = Double(currentNum) ?? 0.0
                switch operation {
                case .addition:
                    result = String(tfLeft + tfRight)
                case .substraction:
                    result = String(tfLeft - tfRight)
                case .division:
                    result = String(tfLeft / tfRight)
                case .multiplicftion:
                    result = String(tfLeft * tfRight)
                default:
                    break
                }
            }
        } else {
            tfLeft = Double(currentNum) ?? 0.0
            currentNum = ""
            updateDisplay(text: currentNum)
            currentOperation = operation
        }
        
        func addition() {
            makeCalculation(operation: .addition)
        }
        
        func substraction() {
            makeCalculation(operation: .substraction)
        }
        
        func division() {
            makeCalculation(operation: .division)
        }
        
        func multiplicftion() {
            makeCalculation(operation: .multiplicftion)
        }
        
        func makeResult() {
            makeCalculation(operation: currentOperation)
        }
        
        func acAction() {
            currentNum = ""
            tfLeft = 0.0
            tfRight = 0.0
            result = ""
            currentOperation = Operations.noAction
            updateDisplay(text: currentNum)
        }
    }
}
