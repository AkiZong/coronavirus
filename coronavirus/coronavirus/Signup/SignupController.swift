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
        print ("new user first name: \(first_name)")
        print ("new user last name: \(last_name)")
        print ("new user email: \(email)")
        print ("new user password: \(password)")
        print ("new user sex: \(sex)")
        print ("new user age: \(age)")
        let newUserInfoDict: Dictionary<String,String> = ["firstName": first_name, "lastName": last_name, "email": email, "password": password, "sex": sex, "age": String(age)]
        let newUserInfo: String = parseUserInfo(userInfo: newUserInfoDict)
        
        writeToCSV(fileName: "allUsers.csv", userInfo: newUserInfo)
        
        //readFile()
    }
    
    // TO DO
    // if csv not created, create it
    // if email already in csv, warning message, otherwise, add to csv
    func createCSV(fileUrl: URL, csvString: String) {
        do {
            try csvString.write(to: fileUrl, atomically: true, encoding: .utf8)
            print("created \(fileUrl)")
        } catch {
            print("Failed to create \(fileUrl)")
        }
    }
    
    func writeToCSV(fileName: String, userInfo: String) {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        let dirUrl = paths[0]
        print("--- dir ulr: \(dirUrl)")
        let fileUrl = dirUrl.appendingPathComponent(fileName)
        let filePath = fileUrl.path
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: filePath) {
            // add new user here
            print("-- file \(fileName) exists, add new user")
            print("-- new user: \(userInfo)")
            do {
                let fileHandle = try FileHandle(forUpdating: fileUrl)
                fileHandle.seekToEndOfFile()
                let data = userInfo.data(using: .utf8)
                fileHandle.write(data!)
            } catch {
                print("Failed to write to \(fileName)")
            }
            
        } else {
            // create allUser.csv
            print("-- file not found, create file first")
            let categories = "\("First Name"),\("Last Name"),\("Email"),\("Password"),\("Sex"),\("Age")\n"
            createCSV(fileUrl: fileUrl, csvString: categories)
        }
    }
    
    func parseUserInfo(userInfo userInfoArray: Dictionary<String, String>) -> String {
        var userInfo = ""
        if let firstName = userInfoArray["firstName"] {
            userInfo = userInfo.appending("\(firstName),")
        }
        if let lastName = userInfoArray["lastName"] {
            userInfo = userInfo.appending("\(lastName),")
        }
        if let email = userInfoArray["email"] {
            userInfo = userInfo.appending("\(email),")
        }
        if let password = userInfoArray["password"] {
            userInfo = userInfo.appending("\(password),")
        }
        if let sex = userInfoArray["sex"] {
            userInfo = userInfo.appending("\(sex),")
        }
        if let age = userInfoArray["age"] {
            userInfo = userInfo.appending("\(age)")
        }
        print(userInfo)
        return userInfo
    }
    
    func readFile() {
        let fileURLProject = Bundle.main.path(forResource: "hello", ofType: "txt")
        //let fileURLProject = Bundle.main.path(forResource: "hello", ofType: "txt")
        print("fileurl: \(String(describing: fileURLProject))")
        var readString = ""
        do {
            readString = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed to read file")
            print(error)
        }
        print(readString)
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

