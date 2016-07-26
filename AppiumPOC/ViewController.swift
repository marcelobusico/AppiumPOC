//
//  ViewController.swift
//  AppiumPOC
//
//  Created by Efrén Reyes on 7/25/16.
//  Copyright © 2016 Globant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLoginPressed(sender: UIButton) {
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        let alert = UIAlertController(title: "Alert", message: "Login pressed", preferredStyle: .Alert)
        alert.addAction(okAction)
        presentViewController(alert, animated: true, completion: nil)
    }

}

