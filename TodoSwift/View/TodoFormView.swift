//
//  TodoFormView.swift
//  TodoSwift
//
//  Created by Theik Chan on 09/09/2024.
//

import SwiftUI

struct TodoFormView: View {
    
    @EnvironmentObject var dataStore: DataStore
    
    @ObservedObject var formVM: TodoFormViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading) {
                    TextField("Todo", text: $formVM.name)
                    Toggle("Completed", isOn: $formVM.completed)
                }
            }.navigationTitle("ToDo")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: cancelButton, trailing: updateSaveButton)
        }
    }
}

extension TodoFormView {
    func updateTodo() {
        let todo = ToDo(id: formVM.id ?? "", name: formVM.name,completed: formVM.completed)
        dataStore.updateTodo(todo)
        presentationMode.wrappedValue.dismiss()
    }
    
    func addTodo() {
        let todo = ToDo(name: formVM.name)
        dataStore.addTodo(todo)
        presentationMode.wrappedValue.dismiss()
    }
    
    var cancelButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Cancel")
        }
    }
    
    var updateSaveButton: some View {
        Button {
            formVM.updating ? updateTodo() : addTodo()
        } label: {
            Text(formVM.updating ? "Update" : "Save")
        }.disabled(formVM.isDiabled)
    }
}

#Preview {
    TodoFormView(formVM: TodoFormViewModel()).environmentObject(DataStore())
}
