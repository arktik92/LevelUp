//
//  GameProfile.swift
//  LevelUp
//
//  Created by Mac n°26 on 11/06/2021.
//
import AVFoundation
import SwiftUI

struct GameProfile: View {
    let game : Game
    @State private var sonValidate: AVAudioPlayer?
    @Binding var popUpIsactive: Bool
    @Binding var popUpIsactive2: Bool
    @Binding var popUpIsactive3: Bool
    @Binding var startGame: Bool
    var columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        let pathValidate = Bundle.main.path(forResource: "SonValidation.mp3", ofType:nil)!
        let urlValidate = URL(fileURLWithPath: pathValidate)
        ZStack {
            BackgroundViews()
                .blur(radius: 3.0)
            
            ZStack{
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .frame(height: 650, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            if popUpIsactive {
                                popUpIsactive.toggle()
                            } else if popUpIsactive2 {
                                popUpIsactive2.toggle()
                            } else if popUpIsactive3 {
                                popUpIsactive3.toggle()
                            }
                        }, label: {
                            Image(systemName: "xmark.circle")
                                .font(.largeTitle)
                        })
                        
                        .foregroundColor(.white)
                        .padding(.trailing, 30)
                    }
                    Spacer()
                }
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
                
                Button(action: {
                    startGame.toggle()
                    
                    do {
                        sonValidate = try AVAudioPlayer(contentsOf: urlValidate)
                        sonValidate?.play()
                    } catch {
                        // couldn't load file :(
                    }
                    playSound(sound: "FlowingRocks", type: "mp3")
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
                
                
                
                
            }.padding(.horizontal,10)
            .padding(.vertical,30)
        }.navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
}


struct GameProfile_Previews: PreviewProvider {
    static var previews: some View {
        GameProfile(game: GAME1, popUpIsactive: .constant(true), popUpIsactive2: .constant(true), popUpIsactive3: .constant(true), startGame: .constant(true))
        
        
    }
}
