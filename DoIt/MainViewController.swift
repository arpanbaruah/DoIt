//
//  MainViewController.swift
//  DoIt
//
//  Created by ARPAN BARUAH on 8/28/17.
//  Copyright © 2017 ARPAN BARUAH. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var newTableView: UITableView!
    
    var doIt : [DoIt] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
     //   doIt = makeDoItList()
        newTableView.dataSource = self
        newTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        newTableView.reloadData()
    }
    
    func getTasks() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
        doIt =  try context.fetch(DoIt.fetchRequest()) as! [DoIt]
        print(doIt)
        } catch {
            print("OOPS WE HAVE AN ERROR")
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doIt.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = doIt[indexPath.row]
        if(task.important == true){
            cell.textLabel?.text = "❗️\(String(describing: task.name!))"
        }
        else {
            cell.textLabel?.text = task.name!
        }
        return cell
    }
    

    
 /*
    func makeDoItList() -> [DoIt] {
        
        let doIt1 = DoIt()
        doIt1.name = " Get Eggs"
        doIt1.important = false
        
        let doIt2 = DoIt()
        doIt2.name = " Call your Ex"
        doIt2.important = false
        
        let doIt3 = DoIt()
        doIt3.name = " Fill gas in wife's car"
        doIt3.important = true
        
        return [doIt1, doIt2, doIt3]
    }
 */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    /*    if(segue.identifier == "addSegue"){
            let currVC = segue.destination
                as! AddTaskViewController
            currVC.previousVC = self
        } */
        if(segue.identifier == "showSegue"){
            let currVC = segue.destination
                as! CompleteTaskViewController
        //    currVC.previousVC = self
            currVC.task = sender as? DoIt
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        print(indexPath.row)
        let task = doIt[indexPath.row]
       // print(task.name)
        performSegue(withIdentifier: "showSegue", sender: task)
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "addSegue", sender: nil)
    }

    
    
    
}

