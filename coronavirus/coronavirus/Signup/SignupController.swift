//
//  SignupController.swift
//  coronavirus
//
//  Created by AkiBone on 2020-04-12.
//  Copyright © 2020 AkiBone. All rights reserved.
//

import UIKit

class SignupController: UIViewController {
    var coronavirus = Coronavirus()
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var sexTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    
    @IBOutlet weak var warning: UILabel!
    var warningMsg = "" {
        didSet {
            warning.text = "\(warningMsg)"
        }
    }
    var qualified = true
    
    @IBAction func joinNow(_ sender: UIButton) {
        warningMsg = ""
        let firstName = firstNameTextField.text!
        if warningMsg == "" {
            warningMsg = coronavirus.checkRequiredInput(Input: firstName, Field: "First Name")
        }
        let lastName = lastNameTextField.text!
        if warningMsg == "" {
            warningMsg = coronavirus.checkRequiredInput(Input: lastName, Field: "Last Name")
        }
        let email = emailTextField.text!
        if warningMsg == "" {
            warningMsg = coronavirus.checkRequiredInput(Input: email, Field: "Email")
        }
        let password = passwordTextField.text!
        if warningMsg == "" {
            warningMsg = coronavirus.checkRequiredInput(Input: password, Field: "Password")
        }
        let sex = sexTextField.text!.uppercased()
        let age = ageTextField.text!
        
        let emailExist = coronavirus.checkEmail(Email: email)
        if emailExist == true {
            warningMsg = "* This email is already registered"
        }
        
        if warningMsg == "" {
            let newUserInfoDict: Dictionary<String,String> = ["firstName": firstName, "lastName": lastName, "email": email, "password": password, "sex": sex, "age": String(age)]
            let newUserInfo: String = parseUserInfo(userInfo: newUserInfoDict)
            coronavirus.writeToCSV(fileName: coronavirus.allUsersDB, userInfo: newUserInfo)
            self.performSegue(withIdentifier: "segueSignupToLogin", sender: self)
        }
        
    }
    
    func parseUserInfo(userInfo userInfoArray: Dictionary<String, String>) -> String {
        var userInfo = ""
        if let firstName = userInfoArray["firstName"] {
            userInfo = userInfo.appending("\(firstName),")
        }
        if let lastName = userInfoArray["lastName"] {
            userInfo = userInfo.appending("\(lastName),")
        }
        if let email = userInfoArray["email"] {
            userInfo = userInfo.appending("\(email),")
        }
        if let password = userInfoArray["password"] {
            userInfo = userInfo.appending("\(password),")
        }
        if let sex = userInfoArray["sex"] {
            userInfo = userInfo.appending("\(sex),")
        }
        if let age = userInfoArray["age"] {
            userInfo = userInfo.appending("\(age)")
        }
        userInfo = userInfo.appending("\n")
        print(userInfo)
        return userInfo
    }
    
// read local file
//    func readFile() {
//        let fileURLProject = Bundle.main.path(forResource: "hello", ofType: "txt")
//        //let fileURLProject = Bundle.main.path(forResource: "hello", ofType: "txt")
//        print("fileurl: \(String(describing: fileURLProject))")
//        var readString = ""
//        do {
//            readString = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
//        } catch let error as NSError {
//            print("Failed to read file")
//            print(error)
//        }
//        print(readString)
//    }

    @IBAction func signupBackToLogin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueSignupToLogin", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

