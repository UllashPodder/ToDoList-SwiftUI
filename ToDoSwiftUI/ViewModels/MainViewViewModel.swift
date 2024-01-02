//
//  MainViewViewModel.swift
//  ToDoSwiftUI
//
//  Created by Ullash Podder on 10/11/2023.
//

import Foundation
import FirebaseAuth
class MainViewViewModel:ObservableObject{
    @Published var currentUserID:String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    init() {
        self.handler = Auth.auth().addStateDidChangeListener {[weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        }
    }
    func isSignedIn()->Bool{
        return Auth.auth().currentUser != nil
    }
}
