//
//  ViewManager.swift
//  3
//
//  Created by Amina TomasMart on 04.02.2024.
//

import UIKit

final class ViewManager {
    
    func getBtn(action: UIAction) -> UIButton {
        
        lazy var btn: UIButton = {
            let btn = UIButton(primaryAction: action)
            btn.frame.size = CGSize(width: 200, height: 50)
            btn .setTitle("next", for: .normal)
            btn.setTitleColor(.black, for: .normal)
            return btn
        }()
        
        return btn
    }
}
