//
//  GameBackground.swift
//  LevelUp
//
//  Created by Laura LONG on 11/06/2021.
//

import SwiftUI

struct GameBackground: View {
    var gamePlanet = PLANET2 //ici remplacer par un binding de type chosenPlanet qui aurait son @State dans Universe.swift
    @State private var rotationPlanet = false
    
    var body: some View {
        ZStack{
            Color("bleuNuit")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Image("fondEtoile")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack{
                HStack {
                    Text("La Science dans la survie")
                        .gradientForeground(colors: [Color("rouge"), Color("violet")])
                        .font(Font.custom("Revalia", size: 25))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName:"person.fill.badge.plus")
                            .foregroundColor(Color("rouge"))
                            .font(.largeTitle)
                    })
                    
                }
                Image("\(gamePlanet.planetImg)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .rotationEffect(.degrees(rotationPlanet ? 360 : 0))
                    .animation(.linear(duration: 15.0))
                
                Spacer()
            }
        }
        .onAppear { rotationPlanet = true }
    }
}

//Pour un effet dégradé de couleur sur du Text
extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}

struct GameBackground_Previews: PreviewProvider {
    static var previews: some View {
        GameBackground()
    }
}

