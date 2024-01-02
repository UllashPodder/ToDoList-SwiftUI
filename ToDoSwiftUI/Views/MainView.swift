//
//  ContentView.swift
//  ToDoSwiftUI
//
//  Created by Ullash Podder on 27/08/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        getView
    }
    @ViewBuilder
    var getView: some View{
        if viewModel.isSignedIn(), !viewModel.currentUserID.isEmpty{
            //signed in
            TabView{
                TodoListView(userId: viewModel.currentUserID)
                    .tabItem { Label("Home", systemImage: "house") }
                ProfileView()
                    .tabItem { Label("Profile", systemImage: "person") }

            }
        }
        else{
            LoginView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
