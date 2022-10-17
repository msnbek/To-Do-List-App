//
//  SignUpVC.swift
//  WeeklyToDoListApp
//
//  Created by Mahmut Şenbek on 17.10.2022.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var emailTextFieldSignUpScreen: UITextField!
    @IBOutlet weak var usernameTextFieldSignUpScreen: UITextField!
    @IBOutlet weak var passwordTextFieldSignUpScreen: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpButtonSigUpScreen(_ sender: Any) {
        
        performSegue(withIdentifier: "toTableViewVC", sender: nil)
    }
    

}
