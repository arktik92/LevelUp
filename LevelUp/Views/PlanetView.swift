//
//  Planete.swift
//  LevelUp
//
//  Created by Laura LONG on 11/06/2021.
//

import SwiftUI

struct PlanetView: View {
    var planet: Planet
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
      
        
//------------------PLANET + BUTTONS--------------------
                    Image(planet.planetImg)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
           
            
            
           
                        
        }
        
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(planet: PLANET1)
    }
}
