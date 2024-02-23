//
//  TBVC.swift
//  NavigationVC
//
//  Created by Amina TomasMart on 21.01.2024.
//

import UIKit

class TBVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.items?[1].title = "Зеленый"
        tabBar.items?[2].title = "Бирюзовый"
        tabBar.items?[3].title = "Желтый"
        tabBar.items?[4].title = "Розовый"
        tabBar.items?[5].title = "Сиреневый"
        tabBar.items?[6].title = "Синий"


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
