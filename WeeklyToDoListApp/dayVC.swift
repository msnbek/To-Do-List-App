//
//  dayVC.swift
//  WeeklyToDoListApp
//
//  Created by Mahmut Şenbek on 17.10.2022.
//

import UIKit

class dayVC: UIViewController {
   
    var day = ""
    var choosenDay = ""
    @IBOutlet weak var writeDayTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
        if writeDayTextField.text == "" {
            
            self.makeAlert(tittleInput: "Error", messageInput: "Please write any day.")
        } else {
            day = writeDayTextField.text!
            performSegue(withIdentifier: "planingVC", sender: nil)
        }
        
     
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        
        performSegue(withIdentifier: "toTableViewVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "planingVC" {
            let destinationVC = segue.destination as! addPlanVC
         destinationVC.addPlanVcDayName = day
            
        }
            
          
            
    }
    
    func makeAlert(tittleInput: String, messageInput: String) {
        
        let alert = UIAlertController(title: tittleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: tittleInput, style: UIAlertAction.Style.default, handler: nil)
        self.present(alert, animated: true)
        alert.addAction(okButton)
        
    }
    
}
