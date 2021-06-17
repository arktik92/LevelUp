//
//  Univers.swift
//  LevelUp
//
//  Created by Laura LONG on 11/06/2021.
//

import SwiftUI



struct Universe: View {
    
    @State var rotationPlanets = false
    var myPlayer : Player
    var planetList : [Planet]
    
    var body: some View {
        ZStack{
            
        BackgroundViews()
            
            VStack {
                HStack{
                        Image("ptsEtoile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    Text("\(myPlayer.totalEtoile)")
                        .foregroundColor(.white)
                        .font(.custom("Revalia", size: 30))
                    
                    Spacer()
            
                        Button(action: {audioPlayer?.stop()
                            
                        }, label: {
                            Image(systemName: "speaker.wave.2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("info")
                        })
                   
                        Button(action: {}, label: {
                            Image("astroProfil")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                    }

            ScrollView(.horizontal) {
                ScrollView(.vertical, showsIndicators: false, content: {
                    ForEach(MY_PLANETS) { item in
                                Image(item.planetImg)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 00, height: 00, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .rotationEffect(.degrees(rotationPlanets ? 360 : 0))
                                    .animation(.linear(duration: 50.0).repeatForever(autoreverses: false))
           
                }
                })
            }
            }
        }.onAppear {
            rotationPlanets = true}
       
    }
}

struct Universe_Previews: PreviewProvider {
    static var previews: some View {

        Universe(myPlayer: PLAYER4, planetList: MY_PLANETS)
            .previewDevice("iPhone 12")
           
  
    }
}
