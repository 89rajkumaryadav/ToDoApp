//
//  ContentView.swift
//  TodoApp
//
//  Created by Rajkumar Yadav on 25/01/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddTaskView = false;
    
   @ObservedObject private var taskVM = TaskListVM()
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Tasks")
                .fontWeight(.bold)
                .font(.system(size: 24))
                .padding()
                
            List{
                ForEach(taskVM.taslList, id: \.self){ item in
                   Text("\(item)")
                }.onDelete { index in
                    taskVM.removeItemFromIndex(of: index)
                }
            }
           
        
            HStack {
                Spacer()
                Button {
                    showAddTaskView.toggle()
                } label: {
                    Text("Add New").foregroundColor(.red).padding()
                }
                
                Spacer()
            }

          
        }.sheet(isPresented: $showAddTaskView) {
            AddTaskView(taskVM: taskVM)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
