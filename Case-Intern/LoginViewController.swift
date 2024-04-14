//
//  loginViewController.swift
//  mobillium-ios
//
//  Created by Zeynep Sevgi on 18.05.2023.
//

import UIKit

class LoginViewController: UIViewController ,RegisterViewControllerDelegate {
    
    
    @IBOutlet weak var emailPromotionLabel: UILabel!
    @IBOutlet weak var emailPromotionButton: UIButton!
    @IBOutlet weak var rememberButton: UIButton!
    @IBOutlet weak var rememberLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    var emailR: String = ""
    var passwordR: String = ""
    var isSelected = false
    var remindMeClicked = false
    var emailClicked = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rememberButton.isSelected = true
        
        emailPromotionButton.isHidden = true
        emailPromotionLabel.isHidden = true
        passwordTextField.isSecureTextEntry = true
        
       // let remember = UserDefaults.standard.bool(forKey: "remember")
        rememberButton.isSelected = false
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        let enteredEmail = nameTextField.text ?? ""
        let enteredPassword = passwordTextField.text ?? ""
        
        
        if verificationEmail(enteredEmail) && verificationPassword(enteredPassword) {
            if enteredEmail == emailR && enteredPassword == passwordR {
                navigationMovieList()
                
            } else {
                if  enteredEmail != self.emailR {
                    displayError(from: self, message: "Eşleşmeyen email ")
                    
                }else if enteredPassword != self.passwordR{
                    displayError(from: self, message: "Eşleşmeyen  şifre")
                    
                }
            }
        } else {
            displayError(from: self, message: "Geçersiz eposta veya parola")
            
        }
    }
    
    
    
    @IBAction func rememberButtonAction(_ sender: UIButton) {
        remindMeClicked.toggle()
        if remindMeClicked {
            
            rememberButton.setImage(UIImage(systemName:"checkmark"), for: .normal)
            emailPromotionLabel.isHidden = false
            emailPromotionButton.isHidden = false
            
        } else {
            rememberButton.setImage(UIImage(systemName:"square"), for: .normal)
        }
    }
    
    @IBAction func emailPromButtonClicked(_ sender: Any) {
        emailClicked.toggle()
        if emailClicked {
            emailPromotionButton.setImage(UIImage(systemName:"checkmark"), for: .normal)
        } else {
            emailPromotionButton.setImage(UIImage(systemName:"square"), for: .normal)
        }
        
    }
    func didRegisterWithEmail(_ email: String, password: String) {
        
        emailR = email
        passwordR = password
    }
    
    func navigationMovieList() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let movieListVC = storyboard.instantiateViewController(withIdentifier: "movieListViewController") as! MovieListViewController
        navigationController?.pushViewController(movieListVC, animated: true)
    }
    
    func verificationEmail(_ email: String) -> Bool {
        return email.count >= 3
    }
    
    func verificationPassword(_ password: String) -> Bool {
        
        return password.count >= 3
    }
    
    
    func displayError(from viewController: UIViewController, message: String) {
        
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let retryAction = UIAlertAction(title: "Retry", style: .default) {
            UIAlertAction in
            self.clearTextFields()
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) {
            UIAlertAction in
            self.dismiss(animated: true ,completion: nil)
            
        }
        
        alertController.addAction(retryAction)
        alertController.addAction(cancelAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    func clearTextFields() {
      //  emailR = ""
       // passwordR = ""
        nameTextField.text = ""
        passwordTextField.text = ""
    }
    
    
}
