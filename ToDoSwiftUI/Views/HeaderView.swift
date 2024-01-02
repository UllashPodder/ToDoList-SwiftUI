//
//  HeaderView.swift
//  ToDoSwiftUI
//
//  Created by Ullash Podder on 18/11/2023.
//

import SwiftUI

struct HeaderView: View {
    let title:String
    let subtitle:String
    let rotationAngle:Double
    let foregroundColor : Color
    var body: some View {
        ZStack{
//            header
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(foregroundColor)
                .rotationEffect(Angle.degrees(rotationAngle))
            VStack{
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.system(size: 45))
                Text(subtitle)
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.system(size: 25))
            }
            .padding(.top,80)
        }
        .frame(width: UIScreen.main.bounds.width*2 , height: 350)
        .offset(y:-150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "subtitle", rotationAngle: 15, foregroundColor: .green)
    }
}
