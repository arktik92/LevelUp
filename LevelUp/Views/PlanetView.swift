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
    
    @State private var rotationState: Double = 0
    var body: some View {
        ZStack {
            //---------------BACKGROUND--------------------------
            Color("bleuNuit")
                .edgesIgnoringSafeArea(.all)
            Image("fondEtoile")
                .resizable()
                .aspectRatio(contentMode: .fit)
            pointEtoile(player: player)
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
            PlanetFormatted(planet: planet, rotationState: $rotationState)
        }
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlanetView(planet: PLANET1, player: PLAYER1)
            PlanetView(planet: PLANET2, player: PLAYER1)
            PlanetView(planet: PLANET3, player: PLAYER1)
            PlanetView(planet: PLANET4, player: PLAYER1)
            PlanetView(planet: PLANET5, player: PLAYER1)
            PlanetView(planet: PLANET1, player: PLAYER1)
                .previewDevice("iPad (8th generation)")
        }
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
                .gesture(RotationGesture()
                            .onChanged { value in
                                self.rotationState = value.degrees
                            }
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
