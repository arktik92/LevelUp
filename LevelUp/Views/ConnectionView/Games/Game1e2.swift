//
//  Game1e2.swift
//  LevelUp
//
//  Created by Lisa Mardjoeki on 15/06/2021.
//

import SwiftUI

struct Game1e2: View {
    
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    
    let rightArrow = Image(systemName: "arrow.right")
    let camera = Image(systemName: "camera.fill")
    let addFriend = Image(systemName: "person.fill.badge.plus")
    
    var body: some View {
        
        VStack{
            // A TOI DE JOUER : PLS --------------------------------
            ScrollView {
                Text("A toi de jouer ! ")
                    .font(Font.custom("Revalia", size: 25).bold())
                    .multilineTextAlignment(.center)
                    .padding()
                
                // Consignes -------
                Text("Il te faut reproduire la Position Latérale de Sécurité. Tu as 2 façons de procéder:\r\(rightArrow)Tu joues le rôle de la victime en PLS et demande à un de tes proches de te photographier\(camera)\r\(rightArrow)Inversement, un de tes proches joue le rôle de la victime en PLS et tu le photographie \(camera)").multilineTextAlignment(.leading)
                
                Spacer()
                
                // Petite Astuce  ---------
                VStack (alignment: .center){
                    subtitleView(subtitle: "Petite astuce")
                    Text("Tu peux utiliser l'icône \(addFriend) en haut à droite de ton écran pour lancer l'invitation auprès d'un ami! ")
                }
                .padding()
                .background(Color(.systemGray4))
                .cornerRadius(40)
                .font(.subheadline)
                
                Spacer()
                
                // ENVOI DE LA PHOTO --------------------------------
                Button(action: {
                    self.showImagePicker = true
                }, label: {
                    HStack {
                        Text("Envoyer la photo")
                        
                        Image(systemName:"camera.fill")
                    }
                    .padding()
                    .background(Color("rouge"))
                    .cornerRadius(25)
                    .foregroundColor(.white)
                    
                })
                
                //AFFICHER LA PHOTO CHOISIE
                //                                if (image != nil){
                //                                    subtitleView(subtitle: "Voici ta photo")
                //                                    image?.resizable().scaledToFit()
                //                                }
            }
            .padding()
            .frame(width: 350, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color(.white))
            .cornerRadius(40)
            .sheet(isPresented: self.$showImagePicker){
                PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
            }
        }
    }
}

struct Game1e2_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            GameBackground()
            Game1e2()
        }
        
    }
}
