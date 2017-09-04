//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by ARPAN BARUAH on 8/30/17.
//  Copyright © 2017 ARPAN BARUAH. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    @IBOutlet weak var showLabel: UILabel!
    
    
  //  var previousVC = MainViewController()
    var task : DoIt? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLabel.text! = task!.name!
        if(task!.important == true){
            showLabel.text = "❗️\(String(describing: task!.name!))"
        }
        else {
            showLabel.text = task!.name!
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeButton(_ sender: Any) {
        
       // print(task.name)
        //print(previousVC.doIt[0].name)
   //     previousVC.doIt.remove(at: previousVC.selectedIndex)
   //     previousVC.newTableView.reloadData()
        // This moves the cursor back to the main task page
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }

    


}
