//
//  MessageView.swift
//  ChatViewTutorial
//
//  Created by Duy Bui on 2/2/20.
//  Copyright © 2020 Duy Bui. All rights reserved.
//
import SwiftUI

struct MessageView : View {
    var currentMessage: Message
    var body: some View {
        VStack {
            HStack(alignment: .bottom, spacing: 15) {
                if !currentMessage.user.isCurrentUser {
                    Image(currentMessage.user.avatar)
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .cornerRadius(20)
                    ContentMessageView(contentMessage: currentMessage.content,
                                       isCurrentUser: currentMessage.user.isCurrentUser)
                } else {
                    Spacer()
                    ContentMessageView(contentMessage: currentMessage.content,
                                       isCurrentUser: currentMessage.user.isCurrentUser)
                    Image(currentMessage.user.avatar)
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .cornerRadius(20)
                }
            }.padding()
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(currentMessage: Message(content: "There are a lot of premium iOS templates on iosapptemplates.com", user: DataSource.secondUser))
    }
}
