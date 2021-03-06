//
//  PlayersProfil.swift
//  LevelUp
//
//  Created by Laura LONG on 11/06/2021.
//

import SwiftUI

struct PlayersProfile: View {
    
    
    @Binding var showPlayerProfile : Bool
    var player: Player
    @EnvironmentObject var points : Player
    
    var body: some View {
        ZStack{
            BackgroundViews()
            
            // EN-TETE HELLO XxxXxxX --------------------------------------
            VStack{
                
                ZStack {
                    
                    
                    HStack {
                        
                        Image(player.playerImg)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(minWidth: 0, idealWidth: 80, maxWidth: 80, minHeight: 0, idealHeight: 80, maxHeight: 80, alignment: .center)
                            .padding()
                        Text("Hello \(player.playerName)")
                            .foregroundColor(.white)
                            .font(Font.custom("Revalia", size: 18))
                            .lineLimit(nil)
                        Spacer()
                    }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 90)
                    .background(Color("violet"))
                    .cornerRadius(30)
                    
                    
                    HStack {
                        Spacer()
                        VStack {
                            Button(action: {
                                showPlayerProfile.toggle()
                                
                            }, label: {
                                HStack{
                                    Spacer()
                                    Image(systemName: "xmark.circle")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                    
                                } .padding()
                                .frame( height: 100, alignment: .center)
                            })
                            Spacer()
                                .frame(height: 50)
                        }
                    }.frame( height: 100, alignment: .center)
                }
                ScrollView {
                    VStack{
                        
                        
                        
                        //TOILE DE COMPETENCE --------------------------------------
                        ZStack {
                            RoundedRectangle(cornerRadius: 90)
                                .foregroundColor(.gray)
                                .opacity(0.6)
                                .padding()
                            RadarChartView(width: 350, MainColor: .white, SubtleColor: .white, quantity_incrementalDividers: 8, dimensions: dimensions, data: points.data)
                        }
                        
                        //HIGHLIGHTS ETOILE && BADGE ----------------------------------
                        HStack (alignment: .center, spacing: 10){
                            HStack{
                                Spacer()
                                Image("ptsEtoile")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 50, maxHeight: 50, alignment: .leading)
                                Text("\(points.totalEtoile)")
                                    .padding()
                                    .font(.custom("Revalia",size:25))
                                    .foregroundColor(Color("bleuNuit"))
                                Spacer()
                            }.background(Color(.white).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/))
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
                                    .font(.custom("Revalia",size:25))
                                    .foregroundColor(Color("bleuNuit"))
                                Spacer()
                            }.background(Color(.white).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/))
                            .cornerRadius(20)
                            
                            .padding(.horizontal)
                        }
                        
                        //HIGHLIGHTS RESUME ----------------------------------
                        VStack (alignment:.center){
                            Text("R??sum??")
                                .padding(.top)
                                .font(Font.custom("Revalia", size: 18))
                            HStack{
                                VStack{
                                    Text("\(points.achievedGame.count)")
                                        .foregroundColor(Color("violet"))
                                        .font(.custom("SFUIDisplay-Regular",size:30))
                                    Text("Serious Game accomplis")
                                        .foregroundColor(Color("bleuNuit"))
                                        .multilineTextAlignment(.center)
                                        .font(.custom("SFUIDisplay-Regular",size:14))
                                        
                                        .padding()
                                }.padding()
                                VStack{
                                    Text("\(player.unlockedPlanet.count)")
                                        .foregroundColor(Color("violet"))
                                        .font(.custom("SFUIDisplay-Regular",size:30))
                                    Text("plan??tes d??verouill??es")
                                        .foregroundColor(Color("bleuNuit"))
                                        .multilineTextAlignment(.center)
                                        .font(.custom("SFUIDisplay-Regular",size:14))
                                        .padding()
                                }.padding()
                            }.padding()
                        }.background(Color(.white).opacity(0.8))
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
                                                .frame(minWidth: 0, idealWidth: 100, maxWidth: 100, minHeight: 0, idealHeight: 100, maxHeight: 100, alignment: .center)
                                            Text("\(achiev.name)")
                                            Text("\(achiev.shortDescription)")
                                                .font(.caption2)
                                            
                                        }
                                        .padding()
                                        .background((Color.white).opacity(0.8))
                                        .foregroundColor(.black)
                                        .cornerRadius(20)
                                    }
                                }
                            }
                        }.padding()
                        
                        //AFFICHAGE DES PLANETES DEBLOQUEES----------------------------------
                        VStack {
                            Text("Plan??tes disponibles")
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
                                                .frame(minWidth: 0, idealWidth: 100, maxWidth: 100, minHeight: 0, idealHeight: 100, maxHeight: 100, alignment: .center)
                                            Text("\(onePlanet.planetName)")
                                                .foregroundColor(Color("bleuNuit"))
                                                .multilineTextAlignment(.center)
                                                .font(.custom("SFUIDisplay-Light",size:20))
                                        }
                                        .padding()
                                        .background((Color.white).opacity(0.8))
                                        .foregroundColor(.black)
                                        .cornerRadius(20)
                                    }
                                }
                            }
                        }.padding()
                    }
                }
            }.padding(0)
        }.ignoresSafeArea()
    }
}

struct PlayersProfile_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayersProfile(showPlayerProfile: .constant(true), player: PLAYER1)
                .environmentObject(Player())
        }
    }
}
