//
//  AddTaskViewController.swift
//  DoIt
//
//  Created by ARPAN BARUAH on 8/28/17.
//  Copyright © 2017 ARPAN BARUAH. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var importantText: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func AddButton(_ sender: UIButton) {
        // Add a task using this button
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = DoIt(context: context)
        task.name = taskName.text!
        task.important = importantText.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    //    print(previousVC.doIt[0].name)
        //previousVC.doIt.append(task)
        // This refreshes the main task page with the latest task.
    //    previousVC.newTableView.reloadData()
        // This moves the cursor back to the main task page
        navigationController!.popViewController(animated: true)
        
    }
    


}
