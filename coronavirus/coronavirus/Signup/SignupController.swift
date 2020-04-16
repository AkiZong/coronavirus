//
//  SignupController.swift
//  coronavirus
//
//  Created by AkiBone on 2020-04-12.
//  Copyright © 2020 AkiBone. All rights reserved.
//

import UIKit

class SignupController: UIViewController {
    
    
    @IBOutlet weak var firstName: UITextField!
    func setupFirstName() -> String {
        return firstName.text!
    }
    
    @IBOutlet weak var lastName: UITextField!
    func setupLastName() -> String {
        return lastName.text!
    }
    
    @IBOutlet weak var email: UITextField!
    func setupEmail() -> String {
        return email.text!
    }
    
    @IBOutlet weak var password: UITextField!
    func setupPassword() -> String {
        return password.text!
    }
    
    @IBOutlet weak var sex: UITextField!
    func setupSex() -> String {
        return sex.text!
    }
    
    @IBOutlet weak var age: UITextField!
    func setupAge() -> String {
        return age.text!
    }
    
    @IBAction func joinNow(_ sender: UIButton) {
        let first_name = setupFirstName()
        let last_name = setupLastName()
        let email = setupEmail()
        let password = setupPassword()
        let sex = setupSex().uppercased()
        let age = setupAge()
        print ("sign up: \(first_name)")
        print ("sign up: \(last_name)")
        print ("sign up: \(email)")
        print ("sign up: \(password)")
        print ("sign up: \(sex)")
        print ("sign up: \(age)")
        //addNewUser()
    }
    
    // TO DO
    // if csv not created, create it
    // if email already in csv, warning message, otherwise, add to csv
    // func addNewUser() {
        // let csvString = "\("First Name"),\("Last Name"),\("Email"),\("Password"),\("Sex"),\("Age")\n\n"
    // }
    
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

