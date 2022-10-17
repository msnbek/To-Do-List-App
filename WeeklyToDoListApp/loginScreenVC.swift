//
//  loginScreenVC.swift
//  WeeklyToDoListApp
//
//  Created by Mahmut Şenbek on 17.10.2022.
//

import UIKit

class loginScreenVC: UIViewController {
    @IBOutlet weak var emailUsernameTextFieldLoginScreen: UITextField!
    @IBOutlet weak var passwordTextFieldLoginScreen: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    
    @IBAction func signInButtonLoginScreen(_ sender: Any) {
        
        
    }
    
    @IBAction func signUpButtonLoginScreen(_ sender: Any) {
        performSegue(withIdentifier: "toSignUpVC", sender: nil)
        
    }
    

}
