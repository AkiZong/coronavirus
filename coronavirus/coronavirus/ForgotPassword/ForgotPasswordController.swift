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
    func provideEmail() {
        EmailTextField.placeholder = "Email"
    }
    
    @IBAction func backToLogin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueForgotToLogin", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        provideEmail()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
