//
//  ForgotPasswordController.swift
//  coronavirus
//
//  Created by AkiBone on 2020-04-12.
//  Copyright © 2020 AkiBone. All rights reserved.
//

import UIKit

class ForgotPasswordController: UIViewController {
    
    @IBOutlet weak var EmailTextField: UITextField!
    func provideEmail() -> String {
        return EmailTextField.text!
    }
    
    @IBAction func backToLogin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueForgotToLogin", sender: self)
    }
    
    @IBAction func resetPassword(_ sender: UIButton) {
        let email = provideEmail()
        print ("reset password: \(email)")
        // if email in database, send reset link
        // else, warning message "email is not registered"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
