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
    @State var startGame: Bool = false
    @State private var rotationState: Double = 0
    @State private var popUpIsActive = false
    var body: some View {
        ZStack {
            //---------------BACKGROUND--------------------------
           BackgroundViews()
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Image("alien1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                        .offset(y: 50)
                        .padding()
                    Spacer()
                    Image("alien2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                        .padding()
                        .offset(x: -60, y: 120)
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
            PlanetFormatted(planet: planet, rotationState: $rotationState, popUpIsActive: $popUpIsActive, startGame: $startGame)
            if popUpIsActive {
                GameProfile(game: GAME1, startGame: $startGame)
            }
            if startGame {
                Game2Onboarding(startGame: $startGame, popUpIsActive: $popUpIsActive)
            }
        }
    }
}






struct PlanetFormatted: View {
    var planet: Planet
    @Binding var rotationState: Double
    @Binding var popUpIsActive: Bool
    @Binding var startGame: Bool
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
                    Button(action: {
                        popUpIsActive.toggle()
                    }, label: {
                        Image("astro1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                           
                    })  .offset(y: -125)
                    
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
                    .font(.title)
                Spacer()
            }
            Spacer()
        }
    }
}















struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
   
        PlanetView(planet: PLANET10, player: PLAYER1)
        PlanetView(planet: PLANET9, player: PLAYER1)
        PlanetView(planet: PLANET8, player: PLAYER1)
        PlanetView(planet: PLANET7, player: PLAYER1)
        PlanetView(planet: PLANET6, player: PLAYER1)
        PlanetView(planet: PLANET5, player: PLAYER1)
        PlanetView(planet: PLANET4, player: PLAYER1)
        PlanetView(planet: PLANET3, player: PLAYER1)
        PlanetView(planet: PLANET12, player: PLAYER1)
        PlanetView(planet: PLANET1, player: PLAYER4)
        
        
    }
}
