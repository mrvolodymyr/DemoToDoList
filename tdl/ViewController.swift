//
//  ViewController.swift
//  tdl
//
//  Created by LinuxPlus on 9/28/17.
//  Copyright © 2017 VolodymyrOsipov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var toDoArray =
        [
            "to buy same food",
            "to visit a doctor",
            "to create the 'ToDoList project' and etc."
        ]

    var myIndex = 0
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "ToDoOrNotToDoList"
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return toDoArray.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        cell.textLabel?.text = toDoArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath)
    {
        tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.none
        ?
            (tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark)
        :
            (tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none)
    }
    
    func tableView(_ tableView: UITableView,
                    commit editingStyle: UITableViewCellEditingStyle,
                    forRowAt indexPath: IndexPath)
    {
        if indexPath.row < toDoArray.count
        {
            toDoArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath],
                                 with: .top)
        }
    }

    /* -- Create alert -- */
    
    func createAlert(title: String,
                     message: String)
    {
        let alertForNewAction = UIAlertController(title: title,
                                                  message: message,
                                                  preferredStyle: UIAlertControllerStyle.alert)
        
        alertForNewAction.addTextField(configurationHandler: { (textField: UITextField) in
            textField.placeholder = "Enter action"
        })
        
        alertForNewAction.addAction(UIAlertAction(title: "OK",
                                                  style: UIAlertActionStyle.default,
                                                  handler: { (action) in
            alertForNewAction.dismiss(animated: true,
                                      completion: nil)
            let textField = alertForNewAction.textFields![0] as UITextField
            self.toDoArray.append(textField.text!)
            self.tableView.reloadData()
        }))
        
        alertForNewAction.addAction(UIAlertAction(title: "Cancel",
                                                  style: UIAlertActionStyle.default,
                                                  handler: { (action) in
            alertForNewAction.dismiss(animated: true,
                                      completion: nil)
        }))
        
        self.present(alertForNewAction,
                     animated: true,
                     completion: nil)
    }

    @IBAction func AddButtonPressed(_ sender: Any)
    {
        createAlert(title: "New action",
                     message: "")
    }
    
    /* -- Open secondVC -- */
    @IBAction func toSecondVC(_ sender: Any)
    {
        performSegue(withIdentifier: "toSecondVC", sender: self)
    }
}

