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
        
    }
    
    func updateTodo(_ todo: ToDo) {
        
    }
    
    func deleteTodo(at indexSet: IndexSet) {
        
    }
    
    func loadTodos() {
        todos = ToDo.sampleData
    }
    
    func saveTodo() {
        print("Save to file")
    }
}

