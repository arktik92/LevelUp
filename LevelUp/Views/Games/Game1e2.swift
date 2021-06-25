//
//  Game1e2.swift
//  LevelUp
//
//  Created by Lisa Mardjoeki on 15/06/2021.
//
import AVFoundation
import SwiftUI

struct Game1e2: View {
    
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    @State private var sonValidate: AVAudioPlayer?
    let rightArrow = Image(systemName: "arrow.right")
    let camera = Image(systemName: "camera.fill")
    let addFriend = Image(systemName: "person.fill.badge.plus")
    
    var body: some View {
        let pathValidate = Bundle.main.path(forResource: "SonValidation.mp3", ofType:nil)!
        let urlValidate = URL(fileURLWithPath: pathValidate)
        VStack{
            // A TOI DE JOUER : PLS --------------------------------
            ScrollView {
                Text("A toi de jouer ! ")
                    .font(Font.custom("Revalia", size: 25).bold())
                    .gradientForeground(colors: [Color("rouge"), Color("violet")])
                    .multilineTextAlignment(.center)
                    .padding()
                
                // Consignes -------
                Text("Il te faut reproduire la Position Latérale de Sécurité. Tu as 2 façons de procéder:\r\(rightArrow)Tu joues le rôle de la victime en PLS et demande à un de tes proches de te photographier\(camera)\r\(rightArrow)Inversement, un de tes proches joue le rôle de la victime en PLS et tu le photographie \(camera)")
                    .font(.custom("SFUIDisplay-Light", size: 18))
                    .foregroundColor(Color("bleuNuit"))
                    .multilineTextAlignment(.leading)
                    
                
                Spacer()
                
                // Petite Astuce  ---------
                VStack (alignment: .center){
                    subtitleView(subtitle: "Petite astuce")
                    Text("Tu peux utiliser l'icône \(addFriend) en haut à droite de ton écran pour lancer l'invitation auprès d'un ami! ")
                        .font(.custom("SFUIDisplay-Light", size: 18))
                        .foregroundColor(Color("bleuNuit"))
                }
                .padding()
                .background(Color("bleuNuit").opacity(0.2))
                .cornerRadius(40)
                .font(.subheadline)
                .padding()
                
                Spacer()
                
                // ENVOI DE LA PHOTO --------------------------------
                Button(action: {
                    self.showImagePicker = true
                    
                    do {
                        sonValidate = try AVAudioPlayer(contentsOf: urlValidate)
                        sonValidate?.play()
                    } catch {
                        // couldn't load file :(
                    }
                    
                }, label: {
                    HStack {
                        Text("Envoyer la photo")
                        
                        Image(systemName:"camera.fill")
                    }
                    .padding()
                    .background(Color("violet"))
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
            .background(Color(.white).opacity(0.8))
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
            GameBackground( gameTitle: "")
            Game1e2()
        }
        
    }
}
