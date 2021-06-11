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
            
      
        
//------------------PLANET + BUTTONS--------------------
                    Image(planet.planetImg)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
            Button(action: {
                //action
            }, label: {
                Image("building1")
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                    .rotationEffect(.degrees(17))
                    .position(x: 240, y: 210)
                   
              
            })
            
            Button(action: {
                //action
            }, label: {
                Image("building2")
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                    .rotationEffect(.degrees(-135))
                    .position(x: 80, y: 460)
                    
              
            })
                        
        }
        
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(planet: PLANET1)
    }
}
