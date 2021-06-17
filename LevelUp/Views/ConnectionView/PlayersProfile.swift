//
//  PlayersProfil.swift
//  LevelUp
//
//  Created by Laura LONG on 11/06/2021.
//

import SwiftUI

struct PlayersProfile: View {
    var player: Player
    
    var body: some View {
        ZStack{
            Color("bleuNuit")
            ScrollView {
                VStack{
                    // EN-TETE HELLO XxxXxxX --------------------------------------
                    HStack {
                        Image(player.playerImg)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 100, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.vertical)
                        Text("Hello \(player.playerName)")
                            .foregroundColor(.white)
                            .font(Font.custom("Revalia", size: 18))
                            .lineLimit(nil)
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 90)
                    .background(Color("violet"))
                    
                    
                    //TOILE DE COMPETENCE --------------------------------------
                    ZStack {
                        RoundedRectangle(cornerRadius: 90)
                            .foregroundColor(.gray)
                            .opacity(0.6)
                            .padding()
                        RadarChartView(width: 350, MainColor: .white, SubtleColor: .white, quantity_incrementalDividers: 8, dimensions: dimensions, data: player.data)
                    }
                    
                    //HIGHLIGHTS ETOILE && BADGE ----------------------------------
                    HStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10){
                        HStack{
                            Spacer()
                            Image("ptsEtoile")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 50, maxHeight: 50, alignment: .leading)
                            Text("\(player.totalEtoile)")
                                .padding()
                                .font(Font.title2.bold())
                            Spacer()
                        }.background(Color(.white))
                        .cornerRadius(20)
                        .padding(.horizontal)
                        
                        HStack{
                            Spacer()
                            Image("gems")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 50, maxHeight: 50, alignment: .leading)
                            Text("\(player.achievments.count)")
                                .padding()
                                .font(Font.title2.bold())
                            Spacer()
                        }.background(Color(.white))
                        .cornerRadius(20)
                        .padding(.horizontal)
                    }
                    
                    //HIGHLIGHTS RESUME ----------------------------------
                    VStack{
                        Text("Résumé")
                            .padding(.top)
                            .font(Font.custom("Revalia", size: 18))
                        HStack{
                            VStack{
                                Text("\(player.achievedGame.count)")
                                    .foregroundColor(Color("violet"))
                                    .font(Font.title.bold())
                                Text("Serious Game accomplis")
                                    .multilineTextAlignment(.center)
                            }.padding()
                            VStack{
                                Text("\(player.unlockedPlanet.count)")
                                    .foregroundColor(Color("violet"))
                                    .font(Font.title.bold())
                                Text("planètes déverouillées")
                                    .multilineTextAlignment(.center)
                            }.padding()
                        }
                    }.background(Color(.white))
                    .cornerRadius(20)
                    .padding()
                    
                    //AFFICHAGE DES BADGES ----------------------------------
                    VStack {
                        Text("Mes badges")
                            .foregroundColor(.white)
                            .font(Font.custom("Revalia", size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        ScrollView(.horizontal){
                            HStack {
                                ForEach(player.achievments, id: \.name) { achiev in
                                    VStack {
                                        Image("\(achiev.imageName)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 100, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        Text("\(achiev.name)")
                                        Text("\(achiev.shortDescription)")
                                            .font(.caption2)
                                        
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(.black)
                                    .cornerRadius(20)
                                }
                            }
                        }
                    }.padding()
                    
                    //AFFICHAGE DES PLANETES DEBLOQUEES----------------------------------
                    VStack {
                        Text("Planètes disponibles")
                            .foregroundColor(.white)
                            .font(Font.custom("Revalia", size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        ScrollView(.horizontal){
                            HStack {
                                ForEach(player.unlockedPlanet, id: \.planetImg) { onePlanet in
                                    VStack {
                                        Image("\(onePlanet.planetImg)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 100, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        Text("\(onePlanet.planetName)")
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(.black)
                                    .cornerRadius(20)
                                }
                            }
                        }
                    }.padding()
                }
            }
        }.ignoresSafeArea()
    }
}

struct PlayersProfile_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayersProfile(player: PLAYER1)
            
        }
    }
}