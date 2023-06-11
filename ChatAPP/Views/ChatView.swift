//
//  ChatView.swift
//  ChatAPP
//
//  Created by Yery Castro on 9/3/23.
//

import SwiftUI

struct ChatView: View {
    
    @EnvironmentObject var login: MessagesViewModel
    @StateObject var messagesModel = MessagesViewModel()
    @State private var username = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                
                ScrollViewReader{ proxy in
                    ScrollView{
                        ForEach(messagesModel.messages){ message in
                            MessagesView(messages: message)
                        }
                    }.padding(.top, 10)
                    
                        .onChange(of: messagesModel.lastId) { id in
                            withAnimation{
                                proxy.scrollTo(id, anchor: .bottom)
                            }
                        }
                }
                
                SendView()
            }.navigationTitle(username)
                .toolbar{
                    Button("Exit"){
                        DispatchQueue.main.async {
                            UserDefaults.standard.removeObject(forKey: "username")
                            UserDefaults.standard.removeObject(forKey: "idUser")
                            login.showChatApp = false
                        }
                    }
                }.onAppear{
                    username = UserDefaults.standard.string(forKey: "username") ?? "user"
                }
        }
    }
}

