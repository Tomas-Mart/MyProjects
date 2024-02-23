//
//  ExtensionView.swift
//  p5m2_6
//
//  Created by Amina TomasMart on 05.02.2024.
//

import UIKit

extension UIView {
    
    static func config<T: UIView>(_ view: T, _ block: (T) -> ()) -> T {
        view.translatesAutoresizingMaskIntoConstraints = false
        block(view)
        return view
    }
}

extension UIButton {
    
    static func config2<T: UIButton>(_ button: T, _ block: (T) -> ()) -> T {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 21).isActive = true
        button.widthAnchor.constraint(equalToConstant: 21).isActive = true
        button.contentMode = .scaleAspectFit
        button.frame.size = CGSize(width: 21, height: 21)
        button.clipsToBounds = true
        button.tintColor = .black
      
        block(button)
        return button
    }
}
