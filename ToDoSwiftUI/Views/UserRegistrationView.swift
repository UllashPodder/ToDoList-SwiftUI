//
//  UserRegistrationView.swift
//  ToDoSwiftUI
//
//  Created by Ullash Podder on 10/11/2023.
//

import SwiftUI

struct UserRegistrationView: View {
    @StateObject var viewModel = UserRegistrationViewModel()
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Let's get started", rotationAngle: -15, foregroundColor: .orange)
            Form{
                if(!viewModel.errorMessage.isEmpty){
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .font(.system(size: 12))
                }
                TextField("Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                BaseButton(title: "Creat Account", backgroundColor: .green) {
                    viewModel.registerUser()
                }
            }
            .offset(y:-50)
            
            Spacer()
        }
    }
}

struct UserRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        UserRegistrationView()
    }
}
