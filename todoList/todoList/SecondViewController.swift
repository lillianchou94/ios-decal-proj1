//
//  SecondViewController.swift
//  todoList
//
//  Created by Lilly Chou on 2/28/16.
//  Copyright © 2016 Lilly Chou. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate ,UITableViewDataSource {
    
    @IBOutlet var completedTaskTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        todoMgr.updateCompletedTasks()
        completedTaskTable.reloadData()
    }
    
    //UITableViewDataSource
    //What data to render
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return todoMgr.completedTasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default")
        cell.textLabel?.text = todoMgr.completedTasks[indexPath.row].name
        cell.detailTextLabel?.text = todoMgr.completedTasks[indexPath.row].description
        
        return cell
    }

}

