//
//  UserLoggedViewController.swift
//  AppiumPOC
//
//  Created by Emiliano Alvarez on 7/26/16.
//  Copyright © 2016 Globant. All rights reserved.
//

import UIKit

class UserLoggedViewController: UIViewController {

  var names = ["Joffrey","Cersei","The hound"]
  
  @IBOutlet weak var tableView: UITableView!
  
  @IBAction func logOut() {
  
    self.dismissViewControllerAnimated(true, completion: nil)
    
  }
  
  
  
  @IBAction func addName(sender: AnyObject) {
    
    let alert = UIAlertController(title: "The list", message: "Add a new name to Arya's kill list", preferredStyle: .Alert)
    
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
    
    self.names.removeAtIndex(indexPath.row)
    self.tableView.reloadData()
  }
  
}
