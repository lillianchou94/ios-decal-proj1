//
//  addTaskViewController.swift
//  todoList
//
//  Created by Lilly Chou on 2/29/16.
//  Copyright © 2016 Lilly Chou. All rights reserved.
//

import UIKit

class addTaskViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textTask: UITextField!
    @IBOutlet var textDescription: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addTask(sender: UIButton){
        todoMgr.addTask(textTask.text!, description: textDescription.text!)
        self.view.endEditing(true)
        textTask.text = ""
        textDescription.text = ""
        self.tabBarController?.selectedIndex = 0
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func endEditing(force: Bool) -> Bool{
        
        
        return true
    }
    
    
    
    //UITextViewDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    
}
