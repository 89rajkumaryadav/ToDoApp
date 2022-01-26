//
//  TaskListVM.swift
//  TodoApp
//
//  Created by Rajkumar Yadav on 25/01/22.
//

import Foundation
import Combine


class TaskListVM:ObservableObject {
    
    @Published var taslList = ["Buy Milk"];
    var addNewTask = PassthroughSubject<String, Never>()
    var subscriptions = Set<AnyCancellable>()
    
    init(){
        
        addNewTask.sink { [unowned self] newTask in
            self.taslList.append(newTask)
            // self.objectWillChange.send()
        }.store(in: &subscriptions)
        
        
      /*  taslList.sink { list in
            self.objectWillChange.send()
        }.store(in: &subscriptions)
        */
    }
    
    func removeItemFromIndex(of index:IndexSet){
        taslList.remove(atOffsets: index)
    }
    
}












