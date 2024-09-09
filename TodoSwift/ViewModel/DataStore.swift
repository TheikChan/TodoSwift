//
//  ToDo.swift
//  TodoSwift
//
//  Created by Theik Chan on 09/09/2024.
//

import Foundation
import SwiftUI

class DataStore: ObservableObject {
    @Published var todos: [ToDo] = []
    
    init() {
        loadTodos()
    }
    
    func addTodo(_ todo: ToDo) {
        todos.append(todo)
    }
    
    func updateTodo(_ todo: ToDo) {
        guard let idx = todos.firstIndex(where: { $0.id == todo.id }) else { return }
        todos[idx] = todo
    }
    
    func deleteTodo(at indexSet: IndexSet) {
        todos.remove(atOffsets: indexSet)
    }
    
    func loadTodos() {
        todos = ToDo.sampleData
    }
    
    func saveTodo() {
        print("Save to file")
    }
}

