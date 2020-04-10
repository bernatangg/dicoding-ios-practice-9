//
//  main.swift
//  MemberDicoding
//
//  Created by Bernadietta Anggie on 10/04/20.
//  Copyright © 2020 Bernadietta Anggie. All rights reserved.
//

import Foundation

func getInputString(message: String) -> String {
    print(message, terminator: " : ")
    return readLine() ?? ""
}

func getInputInt(message: String) -> Int {
    return Int(getInputString(message: message)) ?? 0
}

protocol PersonProtocol {
    var firstName: String {set get}
    var lastName: String {set get}
    var address: String {set get}
    func fullName() -> String
}

class Person: PersonProtocol {
    var firstName: String
    var lastName: String
    var address: String
    init(firstName : String, lastName : String, address : String) {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
    }
    
    func fullName() -> String {
        var parts: [String] = []
        parts += [firstName]
        parts += [lastName]
        return parts.joined(separator: " ")
    }
}

protocol StudentProtocol {
    var school : String {set get}
    func getInformation() -> String
}

class Student: Person, StudentProtocol {
    var school: String = ""
    func getInformation() -> String {
        return "Lemme introduce myself, my name is \(fullName()), i school in \(school). \nLets study together!"
    }
}

print("Welcome to Dicoding Member Application")
print("--------------------------------------")
let firstName = getInputString(message: "Insert your first name")
let lastName = getInputString(message: "Insert your last name")
let address = getInputString(message: "Input your address")
let school = getInputString(message: "Input your school")

let member = Student(firstName: firstName, lastName: lastName, address: address)
member.school = school

print("--------------------------------------")
print(member.getInformation())
print("--------------------------------------")
print("Thank you")

