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
    func setupFirstName() -> String {
        return firstName.text!
    }
    
    @IBOutlet weak var lastName: UITextField!
    func setupLastName() -> String {
        return lastName.text!
    }
    
    @IBOutlet weak var email: UITextField!
    func setupEmail() -> String {
        return email.text!
    }
    
    @IBOutlet weak var password: UITextField!
    func setupPassword() -> String {
        return password.text!
    }
    
    @IBOutlet weak var sex: UITextField!
    func setupSex() -> String {
        return sex.text!
    }
    
    @IBOutlet weak var age: UITextField!
    func setupAge() -> String {
        return age.text!
    }
    
    @IBAction func joinNow(_ sender: UIButton) {
        let first_name = setupFirstName()
        let last_name = setupLastName()
        let email = setupEmail()
        let password = setupPassword()
        let sex = setupSex().uppercased()
        let age = setupAge()
        print ("sign up: \(first_name)")
        print ("sign up: \(last_name)")
        print ("sign up: \(email)")
        print ("sign up: \(password)")
        print ("sign up: \(sex)")
        print ("sign up: \(age)")
        let newUserInfo: Dictionary<String,String> = ["firstName": first_name, "lastName": last_name, "email": email, "password": password, "sex": sex, "age": String(age)]
        let fileURL = createCSV(fileName: "allUsers.csv")
        print (fileURL)
        checkFile(fileName: "allUsers.csv")
        addNewUser(fromURL: fileURL, from: newUserInfo)
    }
    
    // TO DO
    // if csv not created, create it
    // if email already in csv, warning message, otherwise, add to csv
    func createCSV(fileName: String) -> URL {
        let csvString = "\("First Name"),\("Last Name"),\("Email"),\("Password"),\("Sex"),\("Age")\n\n"
        let fileManager = FileManager.default
        var fileURL: URL!
        do {
            let path = try fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
            fileURL = path.appendingPathComponent(fileName)
            try csvString.write(to: fileURL, atomically: true, encoding: .utf8)
            print ("created --> \(fileURL)")
        } catch {
            print("error creating file \(fileName)")
        }
        return fileURL
    }
    
    func addNewUser(fromURL fileURL: URL, from userInfoArray: Dictionary<String, String>) {
        var csvString = ""
        if let firstName = userInfoArray["firstName"] {
            csvString = csvString.appending("\(firstName),")
        }
        if let lastName = userInfoArray["lastName"] {
            csvString = csvString.appending("\(lastName),")
        }
        if let email = userInfoArray["email"] {
            csvString = csvString.appending("\(email),")
        }
        if let password = userInfoArray["password"] {
            csvString = csvString.appending("\(password),")
        }
        if let sex = userInfoArray["sex"] {
            csvString = csvString.appending("\(sex),")
        }
        if let age = userInfoArray["age"] {
            csvString = csvString.appending("\(age)")
        }
        print (csvString)
        do {
            try csvString.write(to: fileURL, atomically: true, encoding: .utf8)
        }
        catch {
            print ("Failed to write to \(fileURL)")
            
        }
    }
    
    func checkFile(fileName: String) {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent(fileName) {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath) {
                print("FILE AVAILABLE")
            } else {
                print("FILE NOT AVAILABLE")
            }
        } else {
            print("FILE PATH NOT AVAILABLE")
        }
    }

    @IBAction func signupBackToLogin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueSignupToLogin", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

