//
//  ViewController.swift
//  coronavirus
//
//  Created by AkiBone on 2020-04-12.
//  Copyright © 2020 AkiBone. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    func setupEmailField() {
        emailTextField.placeholder = "Email"
    }
    
    @IBOutlet weak var passwordTextField: UITextField!
    func setupPasswordField() {
        passwordTextField.placeholder = "Password"
    }
    
    @IBAction func clickLogin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueLoginToGreeting", sender: self)
    }
    
    @IBAction func clickForgotPassword(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueLoginToForgot", sender: self)
    }
    
    @IBAction func clickSignUp(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueLoginToSignup", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEmailField()
        setupPasswordField()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

