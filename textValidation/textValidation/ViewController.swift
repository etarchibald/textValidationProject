//
//  ViewController.swift
//  textValidation
//
//  Created by Ethan Archibald on 9/26/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var displayMessage: UILabel!
    @IBOutlet weak var messageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let specialCharacters = CharacterSet(["@", ",", ".", "!", "#", "$", "%", "^", "&", "*", "<", ">", "?", "+", "=", "-"])
    let uppercaseLetters = CharacterSet.uppercaseLetters
    let lowercaseLetters = CharacterSet.lowercaseLetters
    
    func iSEmailValid(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    @IBAction func submitButton(_ sender: Any) {

        let username = usernameInput.text!
        let passWord = passwordInput.text!
        
        if iSEmailValid(username) == false {
            messageView.backgroundColor = UIColor.black
            displayMessage.text = "Please enter valid Username"
        } else if passWord.count < 8 {
            messageView.backgroundColor = UIColor.black
            displayMessage.text = "Password must be longer"
        } else if (passWord.rangeOfCharacter(from: specialCharacters) != nil)  && (passWord.rangeOfCharacter(from: uppercaseLetters) != nil) && (passWord.rangeOfCharacter(from: lowercaseLetters) != nil) {
            messageView.backgroundColor = UIColor.black
            displayMessage.textColor = UIColor.green
            displayMessage.text = "Seccessful Login Complete is done affermative"
        } else {
            messageView.backgroundColor = UIColor.black
            displayMessage.text = "Password must contain special character, one uppercase, and one lowercase character"
        }
        
    }
    
}

