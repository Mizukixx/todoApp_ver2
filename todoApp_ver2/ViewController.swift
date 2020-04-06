//
//  ViewController.swift
//  todoApp_ver2
//
//  Created by Kozasa Mizuki on 2020/04/05.
//  Copyright © 2020 Kozasa Mizuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var todoTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todolist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TodoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell
        
        cell.todoLabel?.text = todolist[indexPath.row]
        cell.CategoryLabel?.text = categorylist[indexPath.row]
        configureTableView()
        return cell
    }
    
    func configureTableView() {
        todoTableView.rowHeight = 100
    }
    
    //スワイプしたtodoの削除
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            tableView .beginUpdates()
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            todolist.remove(at: indexPath.row)
            categorylist.remove(at: indexPath.row)
        }

        UserDefaults.standard.set(todolist, forKey: "todolist")
        UserDefaults.standard.set(categorylist, forKey: "categorylist")
        tableView.reloadData()
        tableView.endUpdates()
    }
    
    //To try fixing the error
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCell.EditingStyle, forRowAtIndexPath indexPath: IndexPath) {
//
//        if(editingStyle == .delete && indexPath.row < categorylist.count) {
//            categorylist.remove(at: indexPath.row)
//            tableView.reloadData()
//
//            UserDefaults.standard.set(categorylist, forKey: "categorylist")
//            UserDefaults.standard.synchronize()
//        }
//    }
    //fixing code ends
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        todoTableView.dataSource = self
        todoTableView.delegate = self
        
        if UserDefaults.standard.object(forKey: "todolist") != nil {
            todolist = UserDefaults.standard.object(forKey: "todolist") as! [String]
        }
        if UserDefaults.standard.object(forKey: "categorylist") != nil {
            categorylist = UserDefaults.standard.object(forKey: "categorylist") as! [String]
        }
        //カスタムセル（.xib）を紐付ける時は、viewDidLoadメソッド内にregisterを行う
        todoTableView.register(UINib(nibName: "TodoTableViewCell", bundle: nil), forCellReuseIdentifier: "todoCell")
    }
    
    


}

