//
//  GameProfile.swift
//  LevelUp
//
//  Created by Mac n°26 on 11/06/2021.
//

import SwiftUI

struct GameProfile: View {
    let game : Game
    @Binding var startGame: Bool
    var columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 3)
   
    var body: some View {
        ZStack {
            BackgroundViews()
                .blur(radius: 3.0)
            
            ZStack{
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .frame(height: 650, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                
                VStack{
                    
                    Image(game.gameImg)
                    .resizable()
                        .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Text(game.gameName)
                        .font(Font.custom("Revalia", size: 20))
                        .gradientForeground(colors: [Color("rouge"), Color("violet")])
                        .multilineTextAlignment(.center)
                        .padding()
        
                    Text(game.gameShortDescription)
                        .foregroundColor(Color("bleuNuit"))
                        .font(Font.custom("SFUIDisplay-Regular", size: 16))
                        .multilineTextAlignment(.center)
                        .padding()
                        
               
                    Text("Tes points de compétences:").foregroundColor(Color("bleuNuit"))
                        .font(Font.custom("SFUIDisplay-Heavy", size: 20))
                        .multilineTextAlignment(.center)
                        .padding()
                    VStack {
                        if game.nbPtsPro > 0{                            Text("Professionnel : + \(game.nbPtsPro)")
                            .foregroundColor(Color("rouge"))
                            .font(.custom("Revalia", size: 15))
                        }else{
                            EmptyView()
                        }
                            
                        if game.nbPtsHyg > 0{                            Text("Hygiène : + \(game.nbPtsHyg)")
                            .foregroundColor(Color("rouge"))
                            .font(.custom("Revalia", size: 15))
                        }else{
                            EmptyView()
                        }
                        if game.nbPtsQuo > 0{                                Text("Quotidien : + \(game.nbPtsQuo)")
                            .foregroundColor(Color("rouge"))
                            .font(.custom("Revalia", size: 15))
                        }else{
                            EmptyView()
                        }
                        if game.nbPtsSur > 0{                             Text("Survie : +\(game.nbPtsSur)")
                            .foregroundColor(Color("rouge"))
                            .font(.custom("Revalia", size: 15))
                        }else{
                            EmptyView()
                        }
                        if game.nbPtsDevPer > 0{                           Text("Développement Personnel : + \(game.nbPtsDevPer)")
                            .foregroundColor(Color("rouge"))
                            .font(.custom("Revalia", size: 15))
                        }else{
                            EmptyView()
                        }
                        if game.nbPtsPra > 0{                            Text("Pratique : + \(game.nbPtsPra)")
                            .foregroundColor(Color("rouge"))
                            .font(.custom("Revalia", size: 15))
                        }else{
                            EmptyView()
                        }
                            
                        
                    }
             
                    VStack {
                        Text("Tes étoiles à remporter")
                            .foregroundColor(Color("violet"))
                                .font(Font.custom("SFUIDisplay-Heavy", size: 25))
                            .padding()
                        
                        HStack {
                            ForEach(1...game.nbEtoile, id:\.self){_ in
                                Image("ptsEtoile")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                        .frame(width: 200,  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    }
                 
                    
                }.frame(height:650, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
                
                
                
            }

                VStack {
                    Spacer()
                        Spacer()
                            Spacer().frame(height:10)
      
                    if game.gameImg == "cocktail" {
                       
                        Button(action: {
                            startGame.toggle()
                            playSound(sound: "SonValidation", type: "mp3")
                        }, label: {
                            VStack {
                                Text("Commencer à jouer").foregroundColor(.white)
                                    .fixedSize(horizontal: true, vertical: false)
                                    .padding(.vertical,10)
                                    .padding(.horizontal,30)
                                    .background(Color("violet"))
                                    .cornerRadius(20)
                                    .font(Font.custom("SFUIDisplay-Light", size:21))
                            }.frame(maxWidth: .infinity, alignment: .center)
                        })
                            
                    } 
                    
                    
                }.padding(.horizontal,10)
                .padding(.vertical,30)
        }
     
        }
}


struct GameProfile_Previews: PreviewProvider {
    static var previews: some View {
        GameProfile(game: GAME1, startGame: .constant(true))
           
        
    }
}
