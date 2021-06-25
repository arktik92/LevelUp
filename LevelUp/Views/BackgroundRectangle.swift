//
//  BackgroundRectangle.swift
//  LevelUp
//
//  Created by Mac n°26 on 11/06/2021.
//

import SwiftUI

struct BackgroundRectangle: View {
    var color: String
  
    var body: some View {
        ZStack{
            GameBackground(gamePlanet: PLANET1, gameTitle: "La Science dans les Serious Game")
                .blur(radius: 3.0)
               
     
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.yellow, lineWidth: 5)
                .background(Color(color)
                                .cornerRadius(25))
                .frame(width: 350, height: 450, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

        
        }
    }
}

struct BackgroundRectangle_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundRectangle(color: "vert")
    }
}
