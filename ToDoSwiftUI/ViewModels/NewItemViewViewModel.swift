//
//  NewItemViewViewModel.swift
//  ToDoSwiftUI
//
//  Created by Ullash Podder on 27/12/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class NewItemViewViewModel:ObservableObject{
    @Published var title:String = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
//    @Published var title:String
    init() {
        
    }
    func saveItem(){
        guard let uID = Auth.auth().currentUser?.uid else { return }
        let newID = UUID().uuidString
        let newItem = TodoListItem(
            id: newID,
            title: self.title,
            dueDate: self.dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false)
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newID)
            .setData(newItem.asDictionary())
    }
    func isValidItem()->Bool{
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-84600) else{
            return false
        }
//        showAlert = false
        return true
    }
}
