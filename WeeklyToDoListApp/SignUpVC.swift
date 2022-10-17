//
//  SignUpVC.swift
//  WeeklyToDoListApp
//
//  Created by Mahmut Şenbek on 17.10.2022.
//

import UIKit
import Parse

class SignUpVC: UIViewController {
    @IBOutlet weak var emailTextFieldSignUpScreen: UITextField!
    @IBOutlet weak var usernameTextFieldSignUpScreen: UITextField!
    @IBOutlet weak var passwordTextFieldSignUpScreen: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func signUpButtonSigUpScreen(_ sender: Any) {
        
        if emailTextFieldSignUpScreen.text != "" && usernameTextFieldSignUpScreen.text != "" && passwordTextFieldSignUpScreen.text != "" {
            
            let user = PFUser()
            
            user.email = emailTextFieldSignUpScreen.text
            user.username = usernameTextFieldSignUpScreen.text
            user.password = passwordTextFieldSignUpScreen.text
            user.signUpInBackground { success, error in
                if error != nil {
                    
                    self.makeAlert(tittleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                }
                    
                    self.performSegue(withIdentifier: "toBackLoginScreen", sender: nil)
                
            }
            
            
            
        } else {
            
            self.makeAlert(tittleInput: "Error", messageInput: "Please fill sections!")
        }
        
        
        
    }
    func makeAlert(tittleInput: String, messageInput: String) {
        
        let alert = UIAlertController(title: tittleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: tittleInput, style: UIAlertAction.Style.default, handler: nil)
        self.present(alert, animated: true)
        alert.addAction(okButton)
        
    }

}
