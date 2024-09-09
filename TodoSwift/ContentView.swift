//
//  ContentView.swift
//  TodoSwift
//
//  Created by Theik Chan on 09/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dataStore: DataStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dataStore.todos) { toDo in
                    Text(toDo.name)
                        .font(.title3)
                        .strikethrough(toDo.completed)
                        .foregroundStyle(toDo.completed ? .green : Color(.label))
                }
            }.listStyle(.insetGrouped)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("My ToDo")
                        .font(.largeTitle)
                        .foregroundStyle(.red)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView().environmentObject(DataStore())
}
