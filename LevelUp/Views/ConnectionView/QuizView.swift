//
//  QuizView.swift
//  LevelUp
//
//  Created by Mac n°26 on 14/06/2021.
//

import SwiftUI

struct QuizView: View {
    let quiz : [Question] = QuizPotager
    let planetImg: String
    let game = GAME3
    
    @State private var rotationPlanet = false
    
    @State private var counter : Int = 0
    @State var player : Player
    @State private var juste : Double = 0
    @State private var popupShow : Bool = false
    @Binding var showGame: Bool
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color("bleuNuit"))
                .ignoresSafeArea()
            
            GeometryReader { geo in
                VStack {
                    Spacer()
                    ZStack {
                        
                        Circle().foregroundColor(Color("bleuNuit"))
                        Image(planetImg)
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width:geo.size.width*0.3,height:geo.size.height*0.3)
                            .opacity(0.4)
                            .padding(0)
                            .rotationEffect(.degrees(rotationPlanet ? 360 : 0))
                            .animation(.linear(duration: 35.0).repeatForever(autoreverses: false))
                    }
                }.frame(width: geo.size.width, height: geo.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }.onAppear {
                rotationPlanet = true
            }
            Image("fondEtoile")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            GeometryReader{ geo in
                ZStack {
                    ZStack {
                        VStack {
                            VStack {
                                ZStack {
                                    Image("michel")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width:geo.size.width*0.3,height:geo.size.height*0.3)
                                    VStack {
                                        ZStack {
                                            Text(quiz[counter].question)
                                                .frame(maxWidth:geo.size.width*0.8)
                                                .padding(8)
                                                .background(Color(.systemGray4))
                                                .multilineTextAlignment(.center)
                                                
                                                .font(.custom("SFUIDisplay-Light", size: 16))
                                                .frame(width:geo.size.width)
                                        }
                                        Spacer().frame(height:geo.size.height*0.32)
                                    }
                                }
                                QuestionView(counter: $counter, question: quiz[counter],quiz:QuizPotager,juste:$juste)
                                
                                if counter==quiz.count-1{
                                    Button(action:{ withAnimation(.default){
                                            if quiz[counter].selectedInt == quiz[counter].reponse{
                                                juste+=1
                                            }
                                            if juste/Double(quiz.count) >= 0.5{
                                                player.achievedGame.append(game)
                                            }
                                            popupShow.toggle()}},
                                           label:{
                                            Text("Valider")
                                                .foregroundColor(.white)
                                                .padding(.horizontal,50)
                                                .padding(.vertical,12)
                                                .background(Color("vert"))
                                                .cornerRadius(30)
                                                .font(.custom("SFUIDisplay-Light", size: 23))
                                           })
                                }
                                Text("Score : \((juste/(Double(quiz.count))*100).description)%")
                                    .padding()
                                    .background(Color(.systemGray5))
                                    .font(.custom("SFUIDisplay-Light", size: 20))
                            }.frame(width: geo.size.width, height: geo.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                            
                        }
                        if popupShow{
                            PopUpEndOfGame(player: player, game: game, win: (juste/Double(quiz.count)) >= 0.5 ? true : false, showGame: $showGame)
                                .frame(width: geo.size.width  * 0.8, height:  geo.size.height * 0.75)
                        }
                    }
                }
                
            }
        }
    }
}

struct Game3Game_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(planetImg: "planeteTerre", player: PLAYER1,showGame: .constant(true))
    }
}







