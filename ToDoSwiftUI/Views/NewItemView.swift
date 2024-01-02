//
//  NewItem.swift
//  ToDoSwiftUI
//
//  Created by Ullash Podder on 10/11/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var isPresented:Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 35.0))
                .bold()
                .padding(.top, 50)
            Form{
                TextField("Title", text: $viewModel.title)
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                BaseButton(title: "Save", backgroundColor: .blue) {
                    if viewModel.isValidItem(){
                        viewModel.saveItem()
                        isPresented = false
                    }
                    else{
                        viewModel.showAlert = true
                    }
                }.padding()
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text("Please fill in all the fields and select due date today or later"))
            })
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(isPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
