//
//  LoginView.swift
//  ToDoSwiftUI
//
//  Created by Ullash Podder on 10/11/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        VStack{
            HeaderView(title: "To Do List", subtitle: "Get things done", rotationAngle: 15, foregroundColor: .green)
    //            login form
            Form{
                if(!viewModel.errorMessage.isEmpty){
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .font(.system(size: 12))
                }
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                SecureField("Password", text: $viewModel.password)
                BaseButton(title: "Log In", backgroundColor: .blue) {
                    viewModel.login()
                }
            }
            .offset(y:-50)
    //            sign up
            VStack {
                Text("New around here?")
//                show registration
                NavigationLink("Create an Account", destination: UserRegistrationView())
                    .foregroundColor(Color.blue)
            }
            .padding(.bottom, 50)
            
                        Spacer()
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
