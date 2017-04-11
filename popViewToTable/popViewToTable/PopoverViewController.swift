//
//  PopoverViewController.swift
//  popoverTest2
//
//  Created by Thor on 2/23/16.
//  Copyright © 2016 Thor. All rights reserved.
//

import UIKit

class PopOverVariable {
    var popInt = ""
}

var tmpInt: PopOverVariable = PopOverVariable()

class PopoverViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var tmp = ["Item1", "Item2", "Item3", "Item4", "Item5", "Item6", "Item7"]
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tmp.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = tmp[indexPath.row]
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selected = tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text
        tmpInt.popInt = selected!
        print("In Popover and selected \(indexPath.row)")
        print("Saved to \(tmpInt.popInt)")
        navigationController?.popViewControllerAnimated(true) // use with navigationcontroller
        self.dismissViewControllerAnimated(true, completion: nil)
    }
        // use the following with a modal view
        // dismissViewControllerAnimated(true, completion: nil)
        
        
        // alternatively use 
        // override func viewDidLoad(){
        // let toolBar = UIToolBar(frame:)
        // self.view.addSubview(<#T##view: UIView##UIView#>)
        // let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "btnDone:")
        // toolBar.setItems([doneButton], animated: false)
        // }
        
        // note function accepts and argument therefore is an "action:"
        // func btnDone(sender: UIBarButtonItem) {
        //    delegate?.someNewViewControllerDone(self)
        // }

}
