//
//  GreetingController.swift
//  coronavirus
//
//  Created by AkiBone on 2020-04-12.
//  Copyright © 2020 AkiBone. All rights reserved.
//

import UIKit

class GreetingController: UIViewController {
    
    
    @IBAction func greetingBackToLogin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueGreetingToSignup", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
