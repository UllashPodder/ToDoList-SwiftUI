//
//  ToDoSwiftUIApp.swift
//  ToDoSwiftUI
//
//  Created by Ullash Podder on 27/08/2023.
//

import SwiftUI
import FirebaseCore
@main
struct ToDoSwiftUIApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
