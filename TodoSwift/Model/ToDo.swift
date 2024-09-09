//
//  ToDo.swift
//  TodoSwift
//
//  Created by Theik Chan on 09/09/2024.
//

import Foundation

struct ToDo: Identifiable, Codable {
    var id: String = UUID().uuidString
    var name: String
    var completed: Bool = false
    
    static var sampleData: [ToDo] {
        [.init(name: "Get Groceries"),
         .init(name: "Make Dr Appointment", completed: true)]
    }
    
}
