//
//  Message.swift
//  ChatViewTutorial
//
//  Created by Duy Bui on 2/2/20.
//  Copyright © 2020 Duy Bui. All rights reserved.
//
import Foundation

struct Message: Hashable {
    var content: String
    var user: UserChat
}

struct DataSource {
    static let firstUser = UserChat(name: "RockStar452", avatar: "alienProfil")
    static var secondUser = UserChat(name: "John", avatar: "astroProfil", isCurrentUser: true)
    static let messages = [
        Message(content: "Hello la RockStar!", user: DataSource.secondUser),
        Message(content: "Salut, comment vas-tu?", user: DataSource.firstUser),
        Message(content: "Bien, merci 😄. J'aurais besoin d'un peu d'aide pour mon serious game, est-ce que tu peux m'aider stp?", user: DataSource.secondUser),
        Message(content: "Bien sûr, comment puis-je te donner un coup de main?", user: DataSource.firstUser),
    ]
}
