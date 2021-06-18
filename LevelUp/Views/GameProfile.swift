//
//  GameProfile.swift
//  LevelUp
//
//  Created by Mac n°26 on 11/06/2021.
//

import SwiftUI

struct GameProfile: View {
    let game : Game
    @Binding var popUp : Bool
    var columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 3)
   
    var body: some View {
        GeometryReader { geo in
            ZStack {
                BackgroundRectangle(color: "vert")
                VStack {
                    //IMAGE
                    Image(game.gameImg)
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth:geo.size.width*0.9,maxHeight:geo.size.height*0.2,alignment:.top)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    ScrollView{
                        Spacer()
                        //INFOS JEU
                        VStack{
                            Text(game.gameName)
                                .font(Font.custom("SFUIDisplay-Heavy", size: 20))
                                .foregroundColor(Color("violet"))
                                .multilineTextAlignment(.center)
                            Spacer().frame(height:10)
                            Text(game.gameShortDescription)
                                .foregroundColor(.white)
                                .font(Font.custom("SFUIDisplay-Regular", size: 18))
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Spacer().frame(height:10)
                            //INFOS POINTS
                            VStack {
                                Spacer()
                                Text("Points à remporter :").foregroundColor(.white)
                                    .font(Font.custom("SFUIDisplay-Regular", size: 18))
                                Spacer()
                                LazyVGrid(columns: columns,spacing:10){
                                    Text("Pro : \(game.nbPtsPro)")
                                    
                                    Text("Hygiène : \(game.nbPtsHyg)")
                                        .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)
                                    Text("Quo : \(game.nbPtsQuo)")
                                    
                                    Text("Sur : \(game.nbPtsSur)")
                                    
                                    Text("DevPer : \(game.nbPtsDevPer)")
                                        .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)
                                    Text("Pra : \(game.nbPtsPra)")
                                    
                                }.foregroundColor(.white)
                                
                                .font(Font.custom("SFUIDisplay-Regular", size: 18))
                                .frame(maxWidth:.infinity)
                                
                            }
                        }.frame(maxWidth:.infinity)
                        //ETOILES
                        VStack {
                            Spacer().frame(height:20)
                            HStack {
                                ForEach(1...game.nbEtoile, id:\.self){_ in
                                    Image("ptsEtoile")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    
                                    
                                }
                            }
                            .frame(maxWidth:geo.size.width*0.5)
                            
                        }
                    }.padding(.horizontal,15)
                   
                    if game.gameImg == "cocktail" {
                        NavigationLink(
                            destination: Game2Onboarding(),
                            label: {
                               
                                    VStack {
                                        Text("Commencer à jouer").foregroundColor(.white)
                                            .fixedSize(horizontal: true, vertical: false)
                                            .padding(.vertical,10)
                                            .padding(.horizontal,30)
                                            .background(Color("violet"))
                                            .cornerRadius(20)
                                            .font(Font.custom("SFUIDisplay-Regular", size:21))
                                    }.frame(maxWidth: .infinity, alignment: .center)
                                
                            })
                    } else {
                        VStack {
                            Text("Commencer à jouer").foregroundColor(.white)
                                .fixedSize(horizontal: true, vertical: false)
                                .padding(.vertical,10)
                                .padding(.horizontal,30)
                                .background(Color("violet"))
                                .cornerRadius(20)
                                .font(Font.custom("SFUIDisplay-Regular", size:21))
                        }.frame(maxWidth: .infinity, alignment: .center)
                    
                
                    }
                    
                    
                }.padding(.horizontal,10)
                .padding(.vertical,30)
                VStack {
                    HStack {
                        Spacer()
                        Button(){
                            withAnimation(.easeInOut){
                                popUp.toggle()
                            }
                        }label:{
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 35))
                        }
                    }
                    Spacer()
                }.padding(.horizontal,10)
                .padding(.vertical,10)
            }
        }
    }
}



struct GameProfile_Previews: PreviewProvider {
    static var previews: some View {
        GameProfile(game:GAME1, popUp: .constant(true))
           
        
    }
}
