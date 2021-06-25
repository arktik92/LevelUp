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
    @State var isValidate: Bool = false
    @Binding var popUpIsActive: Bool
    @Binding var startGame : Bool
    
    var body: some View {
        ZStack {
            VStack(alignment:.center,spacing:20) {
                Text(game.gameName)
                    .font(.custom("Revalia", size: 15))
                    .gradientForeground(colors: [Color("rouge"), Color("violet")])
                HStack {
                    Image("michel")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text(game.gameDescription)
                        .foregroundColor(Color("bleuNuit"))
                        .font(.custom("SFUIDisplay-Light", size: 18))
                }
                Text("Apporte-moi ton aide")
                    .foregroundColor(.white)
                    .font(.custom("SFUIDisplay-Light", size: 20))
                    
                    .padding(.horizontal,20)
                    .padding(.vertical,15)
                    .background(Color("violet"))
                    .cornerRadius(25)
                    
                
            }.foregroundColor(.white)
            .multilineTextAlignment(.center)
            .frame(width:350)
            .padding(.vertical,35)
            .padding(.horizontal,10)
            .background(Color.white.opacity(0.8))
            .cornerRadius(40)
            //.font(.system(size: 19))
            
        }
    }
}

struct Game3_Previews: PreviewProvider {
    static var previews: some View {
        Game3(player: PLAYER1,planetImg: "planetTerre",popUpIsActive: .constant(false), startGame:.constant(true))
    }
}

