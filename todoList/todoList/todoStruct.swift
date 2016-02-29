//
//  todoStruct.swift
//  todoList
//
//  Created by Lilly Chou on 2/28/16.
//  Copyright © 2016 Lilly Chou. All rights reserved.
//

import UIKit
var todoMgr: todoStruct = todoStruct()
let twoDayinSec: Double = -172800

struct task{
    var name = "no named"
    var description = "no description"
    var timeCompleted: NSDate!
}

class todoStruct: NSObject {
    var todoList = [task]()
    var completedTasks = [task]()
    
    func addTask(name: String, description: String){
        todoList.append(task(name: name, description: description, timeCompleted: nil))
    }
    
    func completeTask(var completedTask: task){
        completedTask.timeCompleted = NSDate.init()
        completedTasks.append(completedTask)
    }
    
    func updateCompletedTasks(){
        if completedTasks.count > 0{
            var t = completedTasks.count - 1
            while t >= 0{
                if completedTasks[t].timeCompleted.timeIntervalSinceNow < twoDayinSec{
                    completedTasks.removeAtIndex(t)
                }
                t--;
            }
        }
        
    }
    

}
