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
    func setupFirstName() {
        firstName.placeholder = "First Name"
    }
    
    @IBOutlet weak var lastName: UITextField!
    func setupLastName() {
        lastName.placeholder = "Last Name"
    }
    
    @IBOutlet weak var email: UITextField!
    func setupEmail() {
        email.placeholder = "Email"
    }
    
    @IBOutlet weak var password: UITextField!
    func setupPassword() {
        password.placeholder = "Password"
    }
    
    @IBOutlet weak var sex: UITextField!
    func setupSex() {
        sex.placeholder = "Sex (M/F)"
    }
    
    @IBOutlet weak var age: UITextField!
    func setupAge() {
        age.placeholder = "Age"
    }
    
    @IBAction func signupBackToLogin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueSignupToLogin", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirstName()
        setupLastName()
        setupEmail()
        setupPassword()
        setupSex()
        setupAge()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

