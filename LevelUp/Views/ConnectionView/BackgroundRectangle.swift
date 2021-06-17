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
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color(color))
                .opacity(0.7)
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color("orPopUp"),lineWidth: 12)
        }
    }
}

struct BackgroundRectangle_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundRectangle(color: "vert")
    }
}
