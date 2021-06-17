//
//  GemeEndPopUp.swift
//  LevelUp
//
//  Created by Mac n°26 on 11/06/2021.
//

import SwiftUI

struct PopUpEndOfGame: View {
    let player : Player
    let game: Game
    var win: Bool
    @Binding var showGame: Bool
    var body: some View {
        if win{
            ZStack{
                BackgroundRectangle(color: "vert").opacity(0.7)
                VStack{
                    
                    Spacer()
                    
                    Text("Félicitations")
                        .font(Font.custom("Revalia", size: 28))
                        .foregroundColor(.white)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 8, x: 4, y: 4)
                    Spacer()
                    
                    Image("trophy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth:.infinity)
                        .padding(.horizontal,50)
                    Spacer()
                    
                    HStack{
                        Text("Tu a gagné \(game.nbEtoile)")
                            .font(Font.custom("Revalia",size:26))
                            .foregroundColor(.white)
                            .fixedSize(horizontal: true, vertical: false)
                        Image("ptsEtoile")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }.shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 8, x: 4, y: 4)
                    
                    Spacer()
                    
                    Button(){
                        showGame.toggle()
                    }label:{
                        Text("Génial")
                            .font(Font.custom("Revalia", size: 22))
                            .foregroundColor(.white)
                            .padding(.vertical,15)
                            .padding(.horizontal,50)
                            .background(Color("violet"))
                            .cornerRadius(35)
                    }.shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 8, x: 4, y: 4)
                    Spacer()
                }.padding(15)
                
            }
        }else{
            ZStack{
                BackgroundRectangle(color:"rouge").opacity(0.7)
                VStack{
                    
                    Spacer()
                    
                    Text("Courage !")
                        .font(Font.custom("Revalia", size: 28))
                        .foregroundColor(.white)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 8, x: 4, y: 4)
                    Spacer()
                    
                    Image("trophy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth:.infinity)
                        .padding(.horizontal,50)
                        .rotationEffect(Angle(degrees: 200))
                        
                    Spacer()
                    
                    HStack{
                        Text("Tu y es presque")
                            .font(Font.custom("Revalia",size:26))
                            .foregroundColor(.white)
                    }.shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 8, x: 4, y: 4)
                    
                    Spacer()
                    
                    Button(){
                        showGame.toggle()
                    }label:{
                        Text("C'est reparti !")
                            .fixedSize(horizontal: true, vertical: false)
                            .font(Font.custom("Revalia", size: 22))
                            .foregroundColor(.white)
                            .padding(.vertical,15)
                            .padding(.horizontal,50)
                            .background(Color("violet"))
                            .cornerRadius(35)
                    }.shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 8, x: 4, y: 4)
                    Spacer()
                }.padding(15)
                    
            }
        }
    }
}

struct PopUpEndOfGame_Previews: PreviewProvider {
    static var previews: some View {
        PopUpEndOfGame(player: PLAYER2, game: GAME1, win: true, showGame: .constant(true))
    }
}
