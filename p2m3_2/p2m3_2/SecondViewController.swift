//
//  SecondViewController.swift
//  p2m3_2
//
//  Created by Amina TomasMart on 17.02.2024.

import UIKit

class SecondViewController: UIViewController {
    
    let array: [String] = ["Test"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if array.count != 0 {
            print("All good")
        } else {
            print("Num of elements in array equal zero")
        }
        
        checkArray()
    }
    
    @discardableResult func checkArray() -> String {
        let x = 2
        let y = 2
        
        if array.count == 0 {
            print(array.last)
            return "All bad"
        }
        return "All good"
    }
}
