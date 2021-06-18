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
    
    @State private var counter : Int = 0
    @State var player : Player
    @State private var juste : Double = 0
    @State private var popupShow : Bool = false
    @Binding var showGame: Bool
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(Color("vert"))
                .opacity(0.8)
                .frame(width: 350, height: 550, alignment: .center)
            VStack {
                GeometryReader{ geo in
                    VStack(alignment:.center){
                        Spacer()
                        Text(quiz[counter].question)
                            .frame(maxWidth:geo.size.width*0.8)
                            .padding(9)
                            .background(Color(.white))
                            .multilineTextAlignment(.center)
                            .cornerRadius(20)
                        Image("michel")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        
                        QuestionView(counter: $counter, question: quiz[counter],quiz:QuizPotager,juste:$juste)
                        
                        Spacer()
                        Text("Score : \((juste/(Double(quiz.count))*100).description)%")
                            .padding()
                            .background(Color(.systemGray5))
                            .font(.custom("SFUIDisplay-Light", size: 20))
                        Spacer()
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
                                        .background(Color("rouge"))
                                        .cornerRadius(30)
                                        .font(.custom("SFUIDisplay-Light", size: 23))
                                        .shadow(color: .black, radius: 10, x: 5, y: 5)
                                    
                                   })
                        }
                        
                        
                    }
                }
                .frame(width: 350, height: 550, alignment: .center)
            }
        }
    }
}


struct Game3Game_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            GameBackground(gamePlanet: PLANET2, gameTitle: "La Science dans ton quotidien")
            QuizView(planetImg: "planeteTerre", player: PLAYER1,showGame: .constant(true))
        }
    }
}







