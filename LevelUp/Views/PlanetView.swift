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
                }
                Spacer()
                HStack {
                    
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
