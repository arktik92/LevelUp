//
//  Game3.swift
//  LevelUp
//
//  Created by Laura LONG on 11/06/2021.
//

import SwiftUI

struct Game3: View {
    let game = GAME3
    @State var player: Player
    let planetImg: String
    @State var showGame : Bool = false
    
    var body: some View {
        ZStack {
            VStack(alignment:.center,spacing:20) {
                Text(game.gameName)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                HStack {
                    Image("michel")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text(game.gameDescription)
                    
                }
                Text("Apporte-moi ton aide ->")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .padding(.horizontal,20)
                    .padding(.vertical,15)
                    .background(Color("violet"))
                    .cornerRadius(15)
            }.foregroundColor(.white)
            .multilineTextAlignment(.center)
            .frame(width:350)
            .padding(.vertical,35)
            .padding(.horizontal,10)
            .background(Color("vert").opacity(0.8))
            .cornerRadius(40)
            .font(.system(size: 19))
        
        }
    }
}

struct Game3_Previews: PreviewProvider {
    static var previews: some View {
        Game3(player: PLAYER1,planetImg: "planetTerre")
    }
}

