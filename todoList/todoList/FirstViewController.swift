//
//  FirstViewController.swift
//  todoList
//
//  Created by Lilly Chou on 2/28/16.
//  Copyright © 2016 Lilly Chou. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var taskTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        taskTable.reloadData()
    }
    
    //UITableViewDataSource
    //What data to render
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return todoMgr.todoList.count
    }
    
    //swipe definition
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?{
        let doneAction = UITableViewRowAction(style: .Normal, title: "Completed"){ (action: UITableViewRowAction!, indexPath: NSIndexPath) -> Void in
            todoMgr.completeTask(todoMgr.todoList[indexPath.row])
            todoMgr.todoList.removeAtIndex(indexPath.row)
            todoMgr.updateCompletedTasks()
            self.taskTable.reloadData()
            
        }
        
        doneAction.backgroundColor = UIColor.greenColor()
        
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete"){ (action: UITableViewRowAction!, indexPath: NSIndexPath) -> Void in
            todoMgr.todoList.removeAtIndex(indexPath.row)
            self.taskTable.reloadData()
        }
        
        return [doneAction, deleteAction]
    }
    
    //swipe enabled
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default")
        cell.textLabel?.text = todoMgr.todoList[indexPath.row].name
        cell.detailTextLabel?.text = todoMgr.todoList[indexPath.row].description
        
        return cell
    }

}

