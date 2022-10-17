//
//  resultVC.swift
//  WeeklyToDoListApp
//
//  Created by Mahmut Şenbek on 18.10.2022.
//

import UIKit
import Parse

class resultVC: UIViewController {
    
    @IBOutlet weak var firstLabel: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var thirdLabel: UILabel!
    
    @IBOutlet weak var fourthLabel: UILabel!
    
    @IBOutlet weak var fifthLabel: UILabel!
    
    @IBOutlet weak var sixthLabel: UILabel!
    
    @IBOutlet weak var dayLabel: UILabel!
    var choosenId = ""

    override func viewDidLoad() {
        super.viewDidLoad()

getDataFromParse()
    }
    
    
    func getDataFromParse() {
        
        let query = PFQuery(className: "Plan")
        query.whereKey("objectId", equalTo: choosenId)
        query.findObjectsInBackground { objects, error in
              
            if error != nil {
                
                self.makeAlert(tittleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
            }else {
                
                if objects != nil {
                    
                    let choosenDay = objects![0]
                    
                    if let oneDay = choosenDay.object(forKey: "one") as? String {
                        self.firstLabel.text = "1.Plan: \(oneDay)"
                        if let twoDay = choosenDay.object(forKey: "two") as? String {
                            self.secondLabel.text = "2.Plan: \(twoDay)"
                            if let threeDay = choosenDay.object(forKey: "three") as? String {
                                self.thirdLabel.text = "3.Plan: \(threeDay)"
                                if let fourDay = choosenDay.object(forKey: "four") as? String {
                                    self.fourthLabel.text = "4.Plan: \(fourDay)"
                                    if let fiveDay = choosenDay.object(forKey: "five") as? String {
                                        self.fifthLabel.text = "5.Plan: \(fiveDay)"
                                        if let sixDay = choosenDay.object(forKey: "six") as? String {
                                            self.sixthLabel.text = "6.Plan: \(sixDay)"
                                            if let dayLabel = choosenDay.object(forKey: "Day") as? String {
                                                self.dayLabel.text = dayLabel
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                }
                
                
            }
            
            
        }
        
    }
    

    func makeAlert(tittleInput: String, messageInput: String) {
        
        let alert = UIAlertController(title: tittleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: tittleInput, style: UIAlertAction.Style.default, handler: nil)
        self.present(alert, animated: true)
        alert.addAction(okButton)
        
    }

    @IBAction func editButton(_ sender: Any) {
        
        performSegue(withIdentifier: "toEdit", sender: nil)
        
    }
}
