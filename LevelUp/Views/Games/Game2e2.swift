//
//  Game2e2.swift
//  LevelUp
//
//  Created by esteban semellier on 23/06/2021.
//

import SwiftUI

struct Game2e2: View {
    
    var myGameDrag : Game
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .padding()
                .foregroundColor(.white)
                .opacity(0.8)
                .frame(height: 560, alignment: .center)
            VStack {
            
                Text(myGameDrag.gameName)
                    .font(Font.custom("Revalia", size: 20))
                    .gradientForeground(colors: [Color("rouge"), Color("violet")])
                    .multilineTextAlignment(.center)
                    .padding()
                
                ZStack {
                    VStack {
                        Text("La densité d'une substance est égale à la masse volumique de la substance ")
                            .font(.custom("SFUIDisplay-Light", size: 18))
                            .foregroundColor(Color("bleuNuit"))
                            .multilineTextAlignment(.center)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .padding(.top, 10)
                        
                Text("La masse volumique, dont le symbole est ρ (rhô), est une propriété caractéristique qui représente la quantité de matière (masse) se trouvant dans un espace (une unité de volume) donné.\n")
                    .font(.custom("SFUIDisplay-Light", size: 18))
                    .foregroundColor(Color("bleuNuit"))
                    .multilineTextAlignment(.center)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.top, 5)
                    
                    }
                } .background(Color("bleuNuit").opacity(0.2))
                .cornerRadius(25)
                .font(.subheadline)
                .padding(10)
                .frame(width: 370, height: 220, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Text("Les cocktails à étages, se fondent sur le principe de la différence de densité des liquides.")
                    .foregroundColor(Color("bleuNuit"))
                    .font(.custom("SFUIDisplay-Light", size: 18))
                    .multilineTextAlignment(.center)
                    .padding(15)
                    
                    Text("Plus un liquide est sucré, plus il est lourd.\nPlus un liquide est alcoolisé, plus il est léger.")
                        .foregroundColor(Color("rouge"))
                        .font(.custom("SFUIDisplay-Regular", size: 18))
                        .multilineTextAlignment(.center)
                        .padding()

            }
        }
    }
}

struct Game2e2_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            GameBackground(gamePlanet: PLANET1, gameTitle: "La science dans le quotidien")
            Game2e2(myGameDrag: GAME1)
        }
    }
}
