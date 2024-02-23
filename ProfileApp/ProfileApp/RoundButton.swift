//
//  RoundButton.swift
//  ProfileApp
//
//  Created by Amina TomasMart on 02.01.2024.
//

import Foundation
import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.width/2
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.width/2
        }
    }
}
