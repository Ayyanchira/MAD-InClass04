//
//  Student.swift
//  InClass04
//
//  Created by Ayyanchira, Akshay Murari on 9/28/17.
//  Copyright © 2017 Ayyanchira, Akshay Murari. All rights reserved.
//

import Foundation

class Student: NSObject {
    var name,emailid,password, department :String
    
    init(name: String, password: String, email: String, department: String) {
        self.name = name
        self.password = password
        self.emailid = email
        self.department = department
    }
    
}
