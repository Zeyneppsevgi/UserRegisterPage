//
//  registerViewController.swift
//  mobillium-ios
//
//  Created by Zeynep Sevgi on 18.05.2023.
//

import UIKit

protocol RegisterViewControllerDelegate: AnyObject {
    func didRegisterWithEmail(_ email: String, password: String)
}

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var rePasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    weak var delegate: RegisterViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        rePasswordTextField.isSecureTextEntry = true
        nameTextField.autocorrectionType = .no
        emailTextField.autocorrectionType = .no
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let rePassword = rePasswordTextField.text ?? ""
        
        if name.isEmpty || email.isEmpty || password.isEmpty || rePassword.isEmpty {
            showAlert(message: "Please fill in all fields.")
        } else if name.count < 3 {
            showAlert(message: "Username must be at least 3 characters long.")
        }else if email.count < 3 {
            showAlert(message: "email must be at least 3 characters long.")
        }else if password.count < 3 {
            showAlert(message: "Password must be at least 3 characters long.")
        }else if password != rePassword {
            showAlert(message: "Passwords do not match.")
        }else {
            performRegistration(name: name, email: email, password: password)
        }
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func performRegistration(name: String, email: String, password: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "loginViewController") as! LoginViewController
        loginVC.emailR = email
        loginVC.passwordR = password
        
        navigationController?.pushViewController(loginVC, animated: true)
    }
}



