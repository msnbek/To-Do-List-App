//
//  ViewController.swift
//  WeeklyToDoListApp
//
//  Created by Mahmut Şenbek on 17.10.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.done, target: self, action: #selector(logoutFunc))
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButton))
    }
    @objc func logoutFunc() {
        
        performSegue(withIdentifier: "logoutConnection", sender: nil)
        
    }
    @objc func addButton() {
        
        performSegue(withIdentifier: "toAddPlanVC", sender: nil)
    }

}

