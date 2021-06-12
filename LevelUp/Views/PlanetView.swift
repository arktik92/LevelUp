//
//  Planete.swift
//  LevelUp
//
//  Created by Laura LONG on 11/06/2021.
//

import SwiftUI

struct PlanetView: View {
    var planet: Planet
    @State private var isTaped: Bool = false
    var body: some View {
        ZStack {
//---------------BACKGROUND--------------------------
            Color("bleuNuit")
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Image("alien1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
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
            PlanetFormatted(planet: planet, isTaped: $isTaped)
           
            
            
           
                        
        }
        .onAppear {
            isTaped = true
        }
        
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlanetView(planet: PLANET1)
            PlanetView(planet: PLANET2)
            PlanetView(planet: PLANET3)
            PlanetView(planet: PLANET4)
            PlanetView(planet: PLANET5)
        }
        
        
    }
}

struct PlanetFormatted: View {
    var planet: Planet
    @Binding var isTaped: Bool
    
    var body: some View {
        Image(planet.planetImg)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 400)
            .aspectRatio(contentMode: .fit)
            .rotationEffect(isTaped ? .degrees(360) : .degrees(0))
            .animation(.linear(duration: 30).repeatForever(autoreverses: false))
    }
}
