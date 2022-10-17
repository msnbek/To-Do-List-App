//
//  loginScreenVC.swift
//  WeeklyToDoListApp
//
//  Created by Mahmut Şenbek on 17.10.2022.
//

import UIKit
import Parse

class loginScreenVC: UIViewController {
    @IBOutlet weak var emailUsernameTextFieldLoginScreen: UITextField!
    @IBOutlet weak var passwordTextFieldLoginScreen: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    
    @IBAction func signInButtonLoginScreen(_ sender: Any) {
        
        if emailUsernameTextFieldLoginScreen.text != "" && passwordTextFieldLoginScreen.text != "" {
            
            PFUser.logInWithUsername(inBackground: emailUsernameTextFieldLoginScreen.text!, password: passwordTextFieldLoginScreen.text!) { success, error in
                
                if error != nil {
                    self.makeAlert(tittleInput: "error", messageInput: error?.localizedDescription ?? "Error")
                    
                }else {
                    self.performSegue(withIdentifier: "signInButton", sender: nil)
                    
                }
                
            }
            
            
            
        }
        
        
    }
    
    @IBAction func signUpButtonLoginScreen(_ sender: Any) {
        
        if emailUsernameTextFieldLoginScreen.text == "" && passwordTextFieldLoginScreen.text == "" {
            
            performSegue(withIdentifier: "toSignUpVC", sender: nil)
            
        }else{
            makeAlert(tittleInput: "Error!", messageInput: "Please delete all sections.")
            
        }
        
        
    }
    
    func makeAlert(tittleInput: String, messageInput: String) {
        
        let alert = UIAlertController(title: tittleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: tittleInput, style: UIAlertAction.Style.default, handler: nil)
        self.present(alert, animated: true)
        alert.addAction(okButton)
        
    }
    
    

}
