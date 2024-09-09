//
//  ContentView.swift
//  TodoSwift
//
//  Created by Theik Chan on 09/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dataStore: DataStore
    
    @State private var modelType: ModelType? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dataStore.todos) { toDo in
                    Button {
                        modelType = .update(toDo)
                    } label: {
                        Text(toDo.name)
                            .font(.title3)
                            .strikethrough(toDo.completed)
                            .foregroundStyle(toDo.completed ? .green : Color(.label))
                    }
                }.onDelete(perform: dataStore.deleteTodo)
            }.listStyle(.insetGrouped)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("My ToDo")
                        .font(.largeTitle)
                        .foregroundStyle(.red)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        modelType = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
        }.sheet(item: $modelType) { $0 }
    }
}

#Preview {
    ContentView().environmentObject(DataStore())
}
