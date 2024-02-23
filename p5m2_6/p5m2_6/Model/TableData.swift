//
//  TableData.swift
//  p5m2_6
//
//  Created by Amina TomasMart on 05.02.2024.
//

import Foundation

struct TableData: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let photo: String
    let text: String
    
    static func getTableData() -> [TableData] {
        return [
        
            TableData(name: "Имя пользователя", photo: "1", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo."),
        
            TableData(name: "Имя пользователя2", photo: "2", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo.")
        
        ]
    }
}
