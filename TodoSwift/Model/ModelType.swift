//
//  ModelType.swift
//  TodoSwift
//
//  Created by Theik Chan on 09/09/2024.
//

import SwiftUI

enum ModelType: Identifiable, View {
    case new
    case update(ToDo)
    
    var id: String {
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }
    
    var body: some View {
        switch self {
        case .new:
            return TodoFormView(formVM: TodoFormViewModel())
        case .update(let toDo):
            return TodoFormView(formVM: TodoFormViewModel(toDo))
        }
    }
}
