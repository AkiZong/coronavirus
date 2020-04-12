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
    }
    
    @IBAction func clickForgotPwd(_ sender: UIButton) {
    }
    
    
    @IBAction func clickSignUp(_ sender: UIButton) {
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

