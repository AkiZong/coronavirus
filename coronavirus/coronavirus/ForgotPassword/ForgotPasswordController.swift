//
//  ForgotPasswordController.swift
//  coronavirus
//
//  Created by AkiBone on 2020-04-12.
//  Copyright © 2020 AkiBone. All rights reserved.
//

import UIKit

class ForgotPasswordController: UIViewController {
    var coronavirus = Coronavirus()
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBAction func backToLogin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueForgotToLogin", sender: self)
    }
    
    @IBOutlet weak var warning: UILabel!
    var warningMsg = "" {
        didSet {
            warning.text = "\(warningMsg)"
        }
    }
    
    @IBAction func resetPassword(_ sender: UIButton) {
        let email = EmailTextField.text!
        let verifyEmail = coronavirus.checkEmail(Email: email)
        if verifyEmail == false {
            warningMsg = "* This email is not registered"
        } else {
            // TO DO: send reset link
            print("will send reset email")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
