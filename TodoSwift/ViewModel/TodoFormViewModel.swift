//
//  TodoFormViewModel.swift
//  TodoSwift
//
//  Created by Theik Chan on 09/09/2024.
//

import Foundation

class TodoFormViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var completed: Bool = false
    
    var id: String?
    
    var updating: Bool {
        id != nil
    }
    
    var isDiabled: Bool {
        name.isEmpty
    }
    
    init() {}
    
    init(_ currentTodo: ToDo) {
        self.name = currentTodo.name
        self.completed = currentTodo.completed
        self.id = currentTodo.id
    }
}


