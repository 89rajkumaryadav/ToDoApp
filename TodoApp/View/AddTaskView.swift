//
//  AddTaskView.swift
//  TodoApp
//
//  Created by Rajkumar Yadav on 25/01/22.
//

import SwiftUI

struct AddTaskView: View {
    @State private var txtTask:String = ""
    @Environment(\.presentationMode) var presentation
     var taskVM:TaskListVM
    var body: some View {
        VStack{
            Text("Add New Task").fontWeight(.bold).font(.title).padding()
            TextField("Task", text: $txtTask)
                .padding()
                .border(.secondary)
                .padding(.horizontal)
            
            HStack{
                Button {
                    presentation.wrappedValue.dismiss()
                } label: {
                    Text("Cancel").fontWeight(.semibold).foregroundColor(.red).padding()
                }
                
                Button {
                    
                    if txtTask.count > 0 {
                        taskVM.addNewTask.send(txtTask)
                        presentation.wrappedValue.dismiss()
                    }
                   
                } label: {
                    Text("Done").fontWeight(.bold).font(.title3).padding().foregroundColor(Color.blue)
                }
            }

        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(taskVM: TaskListVM())
    }
}









