//
//  BaseButton.swift
//  ToDoSwiftUI
//
//  Created by Ullash Podder on 20/11/2023.
//

import SwiftUI

struct BaseButton: View {
    let title:String
    let backgroundColor:Color
    let action: () -> Void
    
    var body: some View {
        Button{
            // login functionality
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        .padding(10)
    }
}

struct BaseButton_Previews: PreviewProvider {
    static var previews: some View {
        BaseButton(title: "Title", backgroundColor: .blue){
            //Action
        }
    }
}
