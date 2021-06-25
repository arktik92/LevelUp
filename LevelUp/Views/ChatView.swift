//
//  ContentView.swift
//  ChatViewTutorial
//
//  Created by Duy Bui on 2/2/20.
//  Copyright © 2020 Duy Bui. All rights reserved.
//
import SwiftUI

struct ChatView: View {
    @State var typingMessage: String = ""
    @EnvironmentObject var chatHelper: ChatHelper
    @ObservedObject private var keyboard = KeyboardResponder()
    @Binding var friendDetail : Bool
    
    var body: some View {
        ZStack {
            Color(.white)
            VStack {
                HStack {
                    Button(action: {
                        friendDetail = false
                    }, label: {
                        Text("< Mes amis")
                            .foregroundColor(.gray)
                            .font(.title3)
                    }).padding([.top, .leading], 22.0)
                    Spacer()
                }
                HStack {
                    
                    Image(DataSource.firstUser.avatar)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: .center)
                    Text(DataSource.firstUser.name)
                        .font(Font.custom("Revalia", size: 25).bold())
                    
                }
                Divider()
                List {
                    ForEach(chatHelper.realTimeMessages, id: \.self) { msg in
                        MessageView(currentMessage: msg)
                    }
                }
                HStack {
                    TextField("Message...", text: $typingMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(minHeight: CGFloat(30))
                    Button(action: sendMessage) {
                        Text("Envoyer")
                    }.padding()
                    .background(Color("bleuNuit"))
                    .cornerRadius(40)
                    .font(Font.custom("Revalia", size: 15))
                    .foregroundColor(.white)
                }.frame(minHeight: CGFloat(50)).padding()
                .edgesIgnoringSafeArea(keyboard.currentHeight == 0.0 ? .leading: .bottom)
            }.onTapGesture {
                self.endEditing(true)
            }
        }
    }
    
    func sendMessage() {
        chatHelper.sendMessage(Message(content: typingMessage, user: DataSource.secondUser))
        typingMessage = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(friendDetail: .constant(true)).environmentObject(ChatHelper())
    }
}
