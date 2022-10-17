//
//  ViewController.swift
//  WeeklyToDoListApp
//
//  Created by Mahmut Şenbek on 17.10.2022.
//

import UIKit
import Parse

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var selectedDay = ""
    var selectedId = ""
    var selectedDayArray = [String]()
    var selectedIdArray = [String]()
    
    override func viewDidLoad() {
        getDataFromAddPlanVC()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.done, target: self, action: #selector(logoutFunc))
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButton))
    }
    
    func getDataFromAddPlanVC() {
        
        let query = PFQuery(className: "Plan")
        query.findObjectsInBackground { objects, error in
            if error != nil {
                self.makeAlert(tittleInput: "error", messageInput: error?.localizedDescription ?? "Error!")
                
            }else {
                
                if objects != nil {
                    
                    
                    self.selectedIdArray.removeAll(keepingCapacity: false)
                    self.selectedDayArray.removeAll(keepingCapacity: false)
                    
                    for object in objects! {
                        
                        if let dayName = object.object(forKey: "Day") as? String {
                            
                            if let dayId = object.objectId  {
                                
                                self.selectedDayArray.append(dayName)
                                self.selectedIdArray.append(dayId)
                                print("test")
                                
                            }
                        }
                        
                        
                        
                    }
                    self.tableView.reloadData()
                }
            }
        }
        
        
        
    }
    
    
    @objc func logoutFunc() {
        
        performSegue(withIdentifier: "logoutConnection", sender: nil)
        
    }
    @objc func addButton() {
        
        performSegue(withIdentifier: "dayVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = selectedDayArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedDayArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedId = selectedIdArray[indexPath.row]
        performSegue(withIdentifier: "toResultVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultVC" {
            
            let destinationVC = segue.destination as! resultVC
            destinationVC.choosenId = selectedId
        }
        
        
    }
    
    
    func makeAlert(tittleInput: String, messageInput: String) {
        
        let alert = UIAlertController(title: tittleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: tittleInput, style: UIAlertAction.Style.default, handler: nil)
        self.present(alert, animated: true)
        alert.addAction(okButton)
        
    }
}

