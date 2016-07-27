//
//  ViewController.swift
//  AppiumPOC
//
//  Created by Efrén Reyes on 7/25/16.
//  Copyright © 2016 Globant. All rights reserved.
//

import UIKit

enum LoginError: ErrorType{
  case InvalidUsername(message:String)
  case InvalidPassword(message:String)
  case InvalidLogin(message:String)
}



class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    

  
  @IBAction func onLoginPressed(sender: UIButton) {
    
    
    do{
      try validateLogin()
      
      self.performSegueWithIdentifier("LoggedIn", sender: self)
    
    }
    catch LoginError.InvalidUsername(let message) {
      showAlert(message)
    }
    catch LoginError.InvalidPassword(let message) {
      showAlert(message)
    }
    catch LoginError.InvalidLogin(let message) {
      showAlert(message)
    }
    catch{
      NSLog("Error Unknown")
    }
    
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "LoggedIn" {
      
      let navController = segue.destinationViewController as! UINavigationController
      let userLoggedViewController = navController.topViewController as! UserLoggedViewController
      
      userLoggedViewController.title = "Welcome \(username.text!)"
      
    }
  }

  
  func validateLogin() throws -> Void {
    guard let usernameText = username.text where !usernameText.isEmpty else {
      throw LoginError.InvalidUsername(message: "Lazy man, enter username")
    }
    
    guard let passwordText = password.text where !passwordText.isEmpty else {
      throw LoginError.InvalidPassword(message: "Seriously?, enter password!")
    }
    
    if usernameText != passwordText {
      throw LoginError.InvalidLogin(message: "To Login use the same username and password")
    }
    

    
  }
  
  
  func showAlert(alertMessage:String){
    let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
    let alert = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: .Alert)
    alert.addAction(okAction)
    presentViewController(alert, animated: true, completion: nil)

  }

}

