//
//  UserRegistrationVIewModel.swift
//  ToDoSwiftUI
//
//  Created by Ullash Podder on 11/12/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserRegistrationViewModel:ObservableObject{
    @Published var name : String = ""
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var errorMessage = ""
    init() {
    }
    func registerUser(){
        guard validate() else{
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard let userId = result?.user.uid else{
                return
            }
            self.insertUser(userId: userId)
        }
    }
    func insertUser(userId:String){
        let newUser = User(id: userId, 
                           name: name,
                           email: email, 
                           created: Date().timeIntervalSince1970,
                           updated: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .setData(newUser.asDictionary())
    }
    private func validate() -> Bool{
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Name, Email or Password can not be empty"
            return false
        }
        guard email.isEmail() else {
            errorMessage = "Please enter a valid email"
            return false
        }
        guard password.isValidPassword() else {
            errorMessage = "Please enter a valid password"
            return false
        }
        errorMessage = ""
        return true

    }
}
