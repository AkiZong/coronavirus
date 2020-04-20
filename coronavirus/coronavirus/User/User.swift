//
//  User.swift
//  coronavirus
//
//  Created by AkiBone on 2020-04-19.
//  Copyright © 2020 AkiBone. All rights reserved.
//

import Foundation

struct User {
    var firstName = ""
    var lastName = ""
    var email = ""
    var password = ""
    var password2 = ""
    var sex = ""
    var age = ""
    
    init(firstName: String, lastName: String, email: String, password: String, password2: String, sex: String, age: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.password2 = password2
        self.sex = sex
        self.age = age
    }
}
