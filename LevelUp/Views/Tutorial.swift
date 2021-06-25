//
//  Tutorial.swift
//  LevelUp
//
//  Created by Laura LONG on 11/06/2021.
//

import SwiftUI

struct Tutorial: View {
    @Binding var showTutorial : Bool
    
    var body: some View {
             
        ZStack {

            VStack {
                Image (systemName: "xmark.circle")
                    .multilineTextAlignment(.trailing)
                Text("Bienvenue dans la Galaxie des connaissances")
                    .font(.custom("Revalia", size: 25))
                    .multilineTextAlignment(.center)
                    .gradientForeground(colors: [Color("rouge"), Color("violet")])
                Text("Découvre comment des connaissances théoriques peuvent être réuitilisées dans ta vie")
                    .font(.custom("SFUIDisplay-Light", size: 18))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("rouge"))
                    .padding()
                
                Text("Une planète, une connaissance")
                    .font(.custom("Revalia", size: 16))
                    .foregroundColor(Color("bleuNuit"))
                
                
                HStack {
                    Image("planetTerre")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding()
                        .frame(width: 60, height: 60, alignment: .center)
                    
                    Text("Sélectionne une planète et balade-toi sur la planète")
                        .font(.custom("SFUIDisplay-Light", size: 16))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("bleuNuit"))
                        .padding()
                    
                }
                
                HStack {
                    Image("building1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding()
                        .frame(width: 60, height: 60, alignment: .center )
                    
                    Text("Sélectionne un élément de la planète et joue à un Serious Game pour comprendre comment cette connaissance peut être utile dans ta vie")
                        .font(.custom("SFUIDisplay-Light", size: 16))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("bleuNuit"))
                        .padding()
                    
                }
                HStack {
                    Image("ptsEtoile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding()
                        .frame(width: 60, height: 60, alignment: .center )
                    
                    Text("Gagne des étoiles pour débloquer des planètes")
                        .font(.custom("SFUIDisplay-Light", size: 16))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("bleuNuit"))
                        .padding()
                    
                }
                HStack {
                    Image("gem1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .frame(width: 60, height: 60, alignment: .center )
                    
                    Text("Gagne des points de compétences et récolte des récompenses")
                        .font(.custom("SFUIDisplay-Light", size: 16))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("bleuNuit"))
                        .padding()
                }
                HStack {
                    Image("astroProfil")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding()
                        .frame(width: 60, height: 60, alignment: .center)
                    
                    Text("Consulte ton profil pour savoir ou tu en es")
                        .font(.custom("SFUIDisplay-Light", size: 16))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("bleuNuit"))
                        .padding()
                    
                }
                
                Text("C'est parti à toi de jouer !")
                    .font(.custom("Revalia", size: 25))
                    .multilineTextAlignment(.center)
                    .gradientForeground(colors: [Color("rouge"), Color("violet")])
                
                
                
            }
            
            
        }
    }
}

struct Tutorial_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial(showTutorial:.constant(true))
    }
}
