//
//  ViewController.swift
//  coronavirus
//
//  Created by AkiBone on 2020-04-12.
//  Copyright © 2020 AkiBone. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    var coronavirus = Coronavirus()
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var warning: UILabel!
    var warningMsg = "" {
        didSet {
            warning.text = "\(warningMsg)"
        }
    }
    
    @IBAction func clickLogin(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        // check if email and password already in database?
        let correntCredentials = coronavirus.checkCredentials(email: email, password: password)
        if correntCredentials == true {
            self.performSegue(withIdentifier: "segueLoginToGreeting", sender: self)
        } else {
            warningMsg = "* Wrong email or password"
        }
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

