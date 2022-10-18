//
//  addPlanVC.swift
//  WeeklyToDoListApp
//
//  Created by Mahmut Şenbek on 17.10.2022.
//

import UIKit
import Parse

class addPlanVC: UIViewController {
    var addPlanVcDayName = ""
    @IBOutlet weak var firstPlanTextField: UITextField!
    @IBOutlet weak var secondPlanTextField: UITextField!
    @IBOutlet weak var thirdPlanTextField: UITextField!
    @IBOutlet weak var fourthPlanTextField: UITextField!
    @IBOutlet weak var fifthPlanTextField: UITextField!
    @IBOutlet weak var sixthPlanTextField: UITextField!
    @IBOutlet weak var dayLabelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayLabelText.text = addPlanVcDayName
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hiddenKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func hiddenKeyboard() {
        
        view.endEditing(true)
    }
    
    @IBAction func saveButtonAddPlanVC(_ sender: Any) {
        
        if firstPlanTextField.text != "" {
            
            let planModel = PlanModel.sharedInstance
            let object = PFObject(className: "Plan")
            
            planModel.firstPlan = firstPlanTextField.text!
            planModel.secondPlan = secondPlanTextField.text!
            planModel.thirdPlan = thirdPlanTextField.text!
            planModel.fourthPlan = fourthPlanTextField.text!
            planModel.fifthPlan = fifthPlanTextField.text!
            planModel.sixthPlan = sixthPlanTextField.text!
            planModel.dayLabel = dayLabelText.text!
            print("test")
            
            object["one"] = planModel.firstPlan
            object["two"] = planModel.secondPlan
            object["three"] = planModel.thirdPlan
            object["four"] = planModel.fourthPlan
            object["five"] = planModel.fifthPlan
            object["six"] = planModel.sixthPlan
            object["Day"] = planModel.dayLabel
          
            object.saveInBackground { success, error in
                
                if error != nil {
                    
                    self.makeAlert(tittleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                }else {
                    print("saved")
                    self.performSegue(withIdentifier: "toDayVC", sender: nil)
                    
                }
            }
            
        } else {
            
            self.makeAlert(tittleInput: "error", messageInput: "Fill section.")
        }
        
       
        
     
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        performSegue(withIdentifier: "toDayVC", sender: nil)
    }
    
    func makeAlert(tittleInput: String, messageInput: String) {
        
        let alert = UIAlertController(title: tittleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: tittleInput, style: UIAlertAction.Style.default, handler: nil)
        self.present(alert, animated: true)
        alert.addAction(okButton)
        
    }
    

}
