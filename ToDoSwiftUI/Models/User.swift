//
//  User.swift
//  ToDoSwiftUI
//
//  Created by Ullash Podder on 10/11/2023.
//

import Foundation
struct User:Codable{
    let id:String
    let name: String
    let email: String
    let created : TimeInterval
    let updated : TimeInterval
}
