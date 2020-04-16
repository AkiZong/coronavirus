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
    
    @IBOutlet weak var greeting: UILabel!
    var greetingWord = "" {
        didSet {
            greeting.text = "\(greetingWord)"
        }
    }
    
    func setupGreeting() {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        if hour >= 6, hour < 12 {
            greetingWord = "Morning"
        } else if hour >= 12, hour < 17 {
            greetingWord = "Afternoon"
        } else {
            greetingWord = "Evining"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGreeting()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
