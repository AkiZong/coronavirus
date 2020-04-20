//
//  Coronavirus.swift
//  coronavirus
//
//  Created by AkiBone on 2020-04-19.
//  Copyright © 2020 AkiBone. All rights reserved.
//

import Foundation

class Coronavirus {
    
    var allUsersDB = "allUsers.csv"
    
    static var currentUser = User(firstName: "", lastName: "", email: "", password: "", password2: "", sex: "", age: "")
    
    func setCurrentUser(FirstName firstName: String, LastName lastName: String, Email email: String, Password password: String, Sex sex: String, Age age: String) {
        Coronavirus.currentUser.firstName = firstName
        Coronavirus.currentUser.lastName = lastName
        Coronavirus.currentUser.email = email
        Coronavirus.currentUser.password = password
        Coronavirus.currentUser.sex = sex
        Coronavirus.currentUser.age = age
        print("from login: \(Coronavirus.currentUser.firstName)")
        print("from login: \(Coronavirus.currentUser.lastName)")
        print("from login: \(Coronavirus.currentUser.email)")
        print("from login: \(Coronavirus.currentUser.password)")
        print("from login: \(Coronavirus.currentUser.sex)")
        print("from login: \(Coronavirus.currentUser.age)")
    }
    
    func getCurrentUser() -> User {
        return Coronavirus.currentUser
    }
    
    // Login check: if input email and password are already in allUsers.csv
    func checkCredentials(email e: String, password pwd: String) -> Bool {
        let fileUrl = getFileUrl(fileName: allUsersDB)
        do {
            let allUserInfo = try String(contentsOf: fileUrl, encoding: .utf8)
            let infoString = allUserInfo.components(separatedBy: .newlines)
            for i in 1..<infoString.count-1 {
                let line = infoString[i]
                let currentUser = line.components(separatedBy: ",")
                if currentUser[2] == e, currentUser[3] == pwd {
                    return true
                }
            }
        } catch {
            print("Failed to get users info from \(allUsersDB)")
        }
        return false
    }
    
    // check if email is already in allUsers.csv
    func checkEmail(Email email: String) -> Bool {
        let fileUrl = getFileUrl(fileName: allUsersDB)
        do {
            let allUserInfo = try String(contentsOf: fileUrl, encoding: .utf8)
            let infoString = allUserInfo.components(separatedBy: .newlines)
            for i in 1..<infoString.count-1 {
                let line = infoString[i]
                let currentUser = line.components(separatedBy: ",")
                if currentUser[2] == email {
                    return true
                }
            }
        } catch {
            print("Failed to get users info from \(allUsersDB)")
        }
        return false
    }
    
    // get one user's information based on email
    func getUserInfo(Email email: String) -> Dictionary<String, String> {
        let fileUrl = getFileUrl(fileName: allUsersDB)
        var userInfo = [String : String]()
        do {
            let allUserInfo = try String(contentsOf: fileUrl, encoding: .utf8)
            let infoString = allUserInfo.components(separatedBy: .newlines)
            for i in 1..<infoString.count-1 {
                let line = infoString[i]
                let currentUser = line.components(separatedBy: ",")
                if currentUser[2] == email {
                    userInfo["firstName"] = currentUser[0]
                    userInfo["lastName"] = currentUser[1]
                    userInfo["email"] = currentUser[2]
                    userInfo["password"] = currentUser[3]
                    userInfo["sex"] = currentUser[4]
                    userInfo["age"] = currentUser[5]
                }
            }
        } catch {
            print("Failed to get users info from \(allUsersDB)")
        }
        return userInfo
    }
    
    // sign up check, new user info check
    // if there is no warning, return true, else return warning and false
    func checkRequiredInput(Input input: String, Field field: String) -> String {
        var warning = ""
        if input == "" {
            warning = "* \(field) is required"
        }
        return warning
    }
    
    func writeToCSV(fileName: String, userInfo: String) {
        let fileUrl = getFileUrl(fileName: fileName)
        let filePath = fileUrl.path
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: filePath) {
            print("-- file not found, create file first")
            let categories = "\("First Name"),\("Last Name"),\("Email"),\("Password"),\("Sex"),\("Age")\n"
            createCSV(fileUrl: fileUrl, csvString: categories)
        }
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
    }
    
    func getFileUrl(fileName file: String) -> URL {
        let fileManager = FileManager.default
        let paths = fileManager.urls(for: .documentDirectory, in: .allDomainsMask)
        let fileUrl = paths[0].appendingPathComponent(file)
        print("!!!! file URL: \(fileUrl)")
        return fileUrl
    }
    
    func createCSV(fileUrl: URL, csvString: String) {
        do {
            try csvString.write(to: fileUrl, atomically: true, encoding: .utf8)
            print("created \(fileUrl)")
        } catch {
            print("Failed to create \(fileUrl)")
        }
    }

}
