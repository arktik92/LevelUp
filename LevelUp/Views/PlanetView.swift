//
//  Planete.swift
//  LevelUp
//
//  Created by Laura LONG on 11/06/2021.
//

import SwiftUI

struct PlanetView: View {
    var planet: Planet
    var player: Player
    @State var popUp = false
    @State var affiche = false
    @State private var rotationState: Double = 0
    var body: some View {
        ZStack {
            //---------------BACKGROUND--------------------------
           BackgroundViews()
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                    HStack {
                        
                        Spacer()
                        Button(action: {
                            self.popUp.toggle()
                        }, label: {
                            Image("alien1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 50)
                                .offset(y: 50)
                                .padding()
                                
                        })
                        Image("alien2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                            .padding()
                    }
                    
                
                Spacer()
                HStack {
                    Image("alien3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                        .padding()
                        .offset(x: 50, y: -50)
                    Spacer()
                    Image("alien4")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                        .padding()
                }
            }
            //------------------PLANET ------------------------------
            PlanetFormatted(planet: planet, rotationState: $rotationState)
            
            if popUp == true {
                GameProfile(game: GAME1, popUp: $popUp)
            }
        }.navigationBarHidden(true)
    }
}
struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
   
            PlanetView(planet: PLANET10, player: PLAYER1)
        
    }
}
struct PlanetFormatted: View {
    var planet: Planet
    @Binding var rotationState: Double
    var body: some View {
        ZStack {
            if planet.planetImg == "planetOrTwo" {
                Image("planetOrThree")
                    .resizable()
                    .aspectRatio(contentMode: .fit
                    )
            }
            Image(planet.planetImg)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 400)
                .aspectRatio(contentMode: .fit)
                .rotationEffect(Angle(degrees: self.rotationState))
                .gesture(DragGesture()
                            .onChanged { value in
                                self.rotationState += Double(value.translation.height) / 20.0                            }
                )
                .overlay(
                    Image("astro1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                        .offset(y: -125)
                )
        }
    }
}
struct pointEtoile: View {
    var player: Player
    var body: some View {
        VStack {
            HStack (spacing: 0) {
                Image("ptsEtoile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                Text("\(player.totalEtoile)")
                    .foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            Spacer()
        }
    }
}