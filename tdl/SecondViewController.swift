//
//  SecondViewController.swift
//  tdl
//
//  Created by LinuxPlus on 9/28/17.
//  Copyright © 2017 VolodymyrOsipov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var createTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Create new action"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for toVCSegue: UIStoryboardSegue, sender: Any?)
    {
        let destinationVC = toVCSegue.destination as! ViewController
        destinationVC.toDoArray.append(createTextField.text!)
//        destinationVC.tableView.reloadData()
    }
    
    @IBAction func okButtonPressed(_ sender: Any)
    {
        if createTextField.text != ""
        {
            performSegue(withIdentifier: "toVCSegue", sender: self)
        }
    }
    

}
