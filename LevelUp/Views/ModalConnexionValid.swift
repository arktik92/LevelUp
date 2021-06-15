//
//  ModalConnexionValid.swift
//  LevelUp
//
//  Created by esteban semellier on 15/06/2021.
//

import SwiftUI

struct ModalConnexionValid: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("bleuNuit")
                    .edgesIgnoringSafeArea(.all)
                Image("fondEtoile")
                VStack {
                    Text("Félicitation")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Clique sur suivant")
                        .foregroundColor(.white)
                    
                    NavigationLink(
                        destination: Onboarding(),
                        label: {
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(.white)
                                .frame(width: 100, height: 50)
                                .overlay(
                                Text("Suivant")
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .fontWeight(.bold)
                        )
                    
                    })
                }
                
            }
        }
    }
}

struct ModalConnexionValid_Previews: PreviewProvider {
    static var previews: some View {
        ModalConnexionValid()
    }
}
