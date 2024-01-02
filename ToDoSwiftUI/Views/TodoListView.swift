//
//  TodoListItemsView.swift
//  ToDoSwiftUI
//
//  Created by Ullash Podder on 10/11/2023.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel = TodoListViewViewModel()
    init(userId:String) {
        
    }
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("To Do List")
            .toolbar(content: {
                Button{
                    viewModel.isShownNewItem = true
                }label: {
                    Image(systemName: "plus")
                }
            })
            .sheet(isPresented: $viewModel.isShownNewItem, content: {
                NewItemView(isPresented: $viewModel.isShownNewItem)
            })
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(userId: "")
    }
}
