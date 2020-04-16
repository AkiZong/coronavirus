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
    func setupEmailField() -> String {
        return emailTextField.text!
        
    }
    
    @IBOutlet weak var passwordTextField: UITextField!
    func setupPasswordField() -> String {
        return passwordTextField.text!
    }
    
    @IBAction func clickLogin(_ sender: UIButton) {
        let email = setupEmailField()
        let password = setupPasswordField()
        print ("login email: \(email)")
        print ("login pwd: \(password)")
        // check if email and password already in database?
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

