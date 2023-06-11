//
//  UsernameView.swift
//  ChatAPP
//
//  Created by Yery Castro on 9/3/23.
//

import SwiftUI

struct UsernameView: View {
    
    @EnvironmentObject var login: MessagesViewModel
    @State private var name = ""
    
    var body: some View {
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Chat App")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 30)
                TextField("Username", text: $name)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    UserDefaults.standard.setValue(name, forKey: "username")
                    UserDefaults.standard.set(UUID().uuidString, forKey: "idUser")
                    login.showChatApp = true
                } label: {
                    Text("Enter")
                        .foregroundColor(.black)
                        .font(.title2)
                        .bold()
                }.buttonStyle(.borderedProminent)
                    .tint(.white)
                    .padding(.top, 10)
                Spacer()

            }.padding(.all)
        }
    }
}

