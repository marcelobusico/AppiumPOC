//
//  UserLoggedViewController.swift
//  AppiumPOC
//
//  Created by Emiliano Alvarez on 7/26/16.
//  Copyright © 2016 Globant. All rights reserved.
//

import UIKit

class UserLoggedViewController: UIViewController {

  var names = ["Row 1", "Row 2", "Row 3", "Row 4", "Row 5", "Row 6", "Row 7", "Row 8", "Row 9", "Row 10", "Row 11", "Row 12", "Row 13", "Row 14", "Row 15", "Row 16", "Row 17", "Row 18", "Row 19", "Row 20", "Row 21", "Row 22", "Row 23", "Row 24", "Row 25", "Row 26", "Row 27", "Row 28", "Row 29", "Row 30", "Row 31", "Row 32", "Row 33", "Row 34", "Row 35", "Row 36", "Row 37", "Row 38", "Row 39", "Row 40", "Row 41", "Row 42", "Row 43", "Row 44", "Row 45", "Row 46", "Row 47", "Row 48", "Row 49", "Row 50"]
  
  @IBOutlet weak var tableView: UITableView!
  
  @IBAction func logOut() {
  
    self.dismissViewControllerAnimated(true, completion: nil)
    
  }
  
  
  
  @IBAction func addName(sender: AnyObject) {
    
    let alert = UIAlertController(title: "The list", message: "Add a new row", preferredStyle: .Alert)
    
    let saveAction = UIAlertAction(title: "Save", style: .Default, handler:{(action:UIAlertAction) -> Void in
      
      let textField = alert.textFields!.first
      self.names.append(textField!.text!)
      self.tableView.reloadData()

    })
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: {(action:UIAlertAction)->Void in
    })
    
    
    alert.addTextFieldWithConfigurationHandler { (texField:UITextField) in
    }
    
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
    
    
    presentViewController(alert, animated: true, completion: nil)
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    
  }

  
}


// MARK: UITableViewDataSource
extension UserLoggedViewController: UITableViewDataSource{
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return names.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
    
    let name = names[indexPath.row]
    
    cell!.textLabel!.text = name
    
    return cell!
  }
  
}

// MARK: UITableViewDelegate
extension UserLoggedViewController: UITableViewDelegate{
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    
    let alert = UIAlertController(title: "The list", message: "You selected \(self.names[indexPath.row])", preferredStyle: .Alert)
    
    let deleteAction = UIAlertAction(title: "Delete", style: .Default, handler:{(action:UIAlertAction) -> Void in
      
      self.names.removeAtIndex(indexPath.row)
      self.tableView.reloadData()
      
    })
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: {(action:UIAlertAction)->Void in
    })

    alert.addAction(deleteAction)
    alert.addAction(cancelAction)
    
    self.presentViewController(alert, animated: true, completion: nil)
    
    
    
  }
  
}
