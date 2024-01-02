//
//  LoginViewViewModel.swift
//  ToDoSwiftUI
//
//  Created by Ullash Podder on 21/11/2023.
//

import Foundation
import FirebaseAuth
class LoginViewViewModel:ObservableObject{
    @Published var email:String = ""
    @Published var password:String = ""
    @Published var errorMessage:String = ""
    init() {
        
    }
    func login(){
        guard validate() else{
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    private func validate() -> Bool{
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Email or Password can not be empty"
            return false
        }
        guard email.isEmail() else {
            errorMessage = "Please enter a valid email"
            return false
        }
        errorMessage = ""
        return true

    }
}
