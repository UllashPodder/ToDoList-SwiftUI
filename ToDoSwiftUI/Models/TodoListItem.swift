//
//  TodoListItem.swift
//  ToDoSwiftUI
//
//  Created by Ullash Podder on 10/11/2023.
//

import Foundation
struct TodoListItem:Codable,Identifiable{
    let id:String
    let title:String
    let dueDate:TimeInterval
    let createdDate:TimeInterval
    var isDone:Bool
    
    mutating func setDone(_ state:Bool){
        isDone = state
    }
}
