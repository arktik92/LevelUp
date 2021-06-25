//
//  Planete.swift
//  LevelUp
//
//  Created by Laura LONG on 11/06/2021.
//
import AVFoundation
import SwiftUI

struct PlanetView: View {
    @Binding var backButton: Bool
    var planet: Planet
    var player: Player
    var game: Game
    @State var startGame: Bool = false
    @State var startGame2: Bool = false
    @State var startGame3: Bool = false
    @State private var rotationState: Double = 0
    @State private var popUpIsActive = false
    @State private var popUpIsActive2 = false
    @State private var popUpIsActive3 = false
    @State private var animationStart = false
    var random = Int.random(in: 0...3)
    var body: some View {
        ZStack {
            //---------------BACKGROUND--------------------------
            BackgroundViews()
                .edgesIgnoringSafeArea(.all)
            
            //------------------PLANET ------------------------------
            PlanetFormatted(backButton: $backButton, planet: planet, rotationState: $rotationState, popUpIsActive: $popUpIsActive, startGame: $startGame)
//                .overlay(
//                    VStack {
//                        Text("\(rotationState)")
//                    }
//                )
            VStack {
                HStack {
                        Image("alien1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                    .offset(y: animationStart ? 50 : 45)
                    .animation(.easeInOut(duration: 6).repeatForever(autoreverses: true))
                    .padding()
                    
                    Spacer()
                
                        Image("alien2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                    .padding()
                    .offset(x: -60, y: (animationStart ? 120 : 115))
                    .animation(.easeInOut(duration: 6).repeatForever(autoreverses: true))
                    
                }
                
                Spacer()
                
                HStack {
                        Image("alien3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                    
                    .padding()
                    .offset(x: 50, y: (animationStart ? -50 : -40))
                    .animation(.easeInOut(duration: 6).repeatForever(autoreverses: true))
                    
                    
                    Spacer()
                        Image("alien4")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                    .offset(y: (animationStart ? 0 : -10))
                    .animation(.easeInOut(duration: 6).repeatForever(autoreverses: true))
                    .padding()
                }
            }
            if popUpIsActive {
                GameProfile(game: GAME1, popUpIsactive: $popUpIsActive, popUpIsactive2: $popUpIsActive2, popUpIsactive3: $popUpIsActive3, startGame: $startGame)
            } else if popUpIsActive2{
                GameProfile(game: GAME2, popUpIsactive: $popUpIsActive, popUpIsactive2: $popUpIsActive2, popUpIsactive3: $popUpIsActive3, startGame: $startGame2)
            } else if popUpIsActive3{
                GameProfile(game: GAME3, popUpIsactive: $popUpIsActive, popUpIsactive2: $popUpIsActive2, popUpIsactive3: $popUpIsActive3, startGame: $startGame3)
            } else {
                EmptyView()
            }
            if startGame {
                Game2Onboarding(startGame: $startGame, popUpIsActive: $popUpIsActive)
            } else if startGame2 {
                Game1Onboarding()
            } else if startGame3 {
                Game3Onboarding(startGame: $startGame3, popUpIsActive: $popUpIsActive3)
            } else {
                EmptyView()
            }
            
            VStack {
                Spacer()
                PopUpRotation(popUpIsActive: $popUpIsActive, popUpIsActive2: $popUpIsActive2, popUpIsActive3: $popUpIsActive3, rotationState: $rotationState, game: GAME1)
                Spacer()
                    .frame(height: 600)
            }
            
        }.onAppear {
            animationStart = true
        }
        //        .onDisappear {
        //            audioPlayer?.pause()
        //        }
    }
}






struct PlanetFormatted: View {
    @Binding var backButton: Bool
    var planet: Planet
    @Binding var rotationState: Double
    @Binding var popUpIsActive: Bool
    @Binding var startGame: Bool
    @State var lastRotation: Double = 0
    
    var body: some View {
        ZStack {
            if planet.planetImg == "planetOrTwo" {
                Image("planetOrThree")
                    .resizable()
                    .aspectRatio(contentMode: .fit
                    )
            }
            Image(planet.planetImg)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 400)
                .aspectRatio(contentMode: .fit)
                .rotationEffect(Angle(degrees: rotationState))
                .gesture(DragGesture()
                            .onChanged { value in
                                self.rotationState = Double(value.translation.height) + lastRotation
                                
                            }
                            .onEnded({ value in
                                lastRotation = rotationState
                            })
                )
                .overlay(
                    Image("astro1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                        
                        
                        .offset(y: -125)
                    
                )
        }.navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
                                    backButton.toggle()
                                }, label: {
                                    HStack {
                                        Image(systemName: "chevron.backward")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .font(.title)
                                            .foregroundColor(.white)
                                        Text("Retour Univers")
                                            .foregroundColor(.white)
                                    }
                                })
                            
        )
        
        
    }
}
struct pointEtoile: View {
    var player: Player
    var body: some View {
        VStack {
            HStack (spacing: 0) {
                Image("ptsEtoile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                Text("\(player.totalEtoile)")
                    .foregroundColor(.white)
                    .font(.title)
                Spacer()
            }
            Spacer()
        }
    }
}

struct PopUpRotation: View {
    @Binding var popUpIsActive: Bool
    @Binding var popUpIsActive2: Bool
    @Binding var popUpIsActive3: Bool
    @Binding var rotationState: Double
    var PopUpRotationIsActive = true
    var game: Game
    var body: some View {
        if PopUpRotationIsActive && !popUpIsActive && !popUpIsActive2 && !popUpIsActive3 {
        if rotationState < -10 && rotationState > -24 || rotationState < -10 - 360 && rotationState > -24 - 360  {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.white)
                .frame(width: 300, height: 200)
                .opacity(0.8)
                .overlay(
                    VStack {
                        Text("La masse volumique pour")
                            .gradientForeground(colors: [Color("rouge"), Color("violet")])
                                                    .font(Font.custom("Revalia", size: 15))
                                                    .multilineTextAlignment(.center)
                            
                        Text(" créer des cocktails")
                            .gradientForeground(colors: [Color("rouge"), Color("violet")])
                                                    .font(Font.custom("Revalia", size: 15))
                                                    .multilineTextAlignment(.center)
                       
                        Text("Nombre d'étoiles à gagner")
                            .font(.custom("SFUIDisplay-Light", size: 18))
                                               .foregroundColor(Color("bleuNuit"))
                                               .multilineTextAlignment(.center)
                            .padding(.top, 20)
                        HStack {
                            Image("ptsEtoile")
                                .resizable()
                                .aspectRatio(contentMode: .fit
                                )
                                .frame(height: 40)
                            Image("ptsEtoile")
                                .resizable()
                                .aspectRatio(contentMode: .fit
                                )
                            Image("ptsEtoile")
                                .resizable()
                                .aspectRatio(contentMode: .fit
                                )
                        }
                        Button(action: {
                            popUpIsActive.toggle()
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 100, height: 30)
                                    .foregroundColor(Color("violet"))
                                    .clipShape(Capsule())
                                Text("Go")
                                    .foregroundColor(.white)
                            }
                            
                        }).padding()
                    }.padding(.top, 20)
                    
                )
            
        } else if rotationState < -83 && rotationState > -101 || rotationState < -83 - 360 && rotationState > -101 - 360  {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.white)
                .frame(width: 300, height: 200)
                .opacity(0.8)
                .overlay(
                    VStack {
                        Text("L'anatomie pour sauver")
                            .gradientForeground(colors: [Color("rouge"), Color("violet")])
                                                    .font(Font.custom("Revalia", size: 15))
                                                    .multilineTextAlignment(.center)
                        Text("des vies")
                            .gradientForeground(colors: [Color("rouge"), Color("violet")])
                                                    .font(Font.custom("Revalia", size: 15))
                                                    .multilineTextAlignment(.center)
                        
                    
                        Text("Nombre d'étoiles à gagner")
                            .font(.custom("SFUIDisplay-Light", size: 18))
                                               .foregroundColor(Color("bleuNuit"))
                                               .multilineTextAlignment(.center)
                            .padding(.top, 20)
                        HStack {
                            Image("ptsEtoile")
                                .resizable()
                                .aspectRatio(contentMode: .fit
                                )
                                .frame(height: 40)
                            Image("ptsEtoile")
                                .resizable()
                                .aspectRatio(contentMode: .fit
                                )
                           
                        }
                        Button(action: {
                            popUpIsActive2.toggle()
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 100, height: 30)
                                    .foregroundColor(Color("violet"))
                                    .clipShape(Capsule())
                                Text("Go")
                                    .foregroundColor(.white)
                            }
                            
                        }).padding()
                    }.padding(.top, 20)
                    
                )
        } else if rotationState < -150 && rotationState > -168 || rotationState < -150 - 360 && rotationState > -168 - 360   {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.white)
                .frame(width: 300, height: 218)
                .opacity(0.8)
                .overlay(
                    VStack {
                        Text("L'évolution du vivant pour")
                            .gradientForeground(colors: [Color("rouge"), Color("violet")])
                                                    .font(Font.custom("Revalia", size: 15))
                                                    .multilineTextAlignment(.center)
                        Text("créer un potager")
                            .gradientForeground(colors: [Color("rouge"), Color("violet")])
                                                    .font(Font.custom("Revalia", size: 15))
                                                    .multilineTextAlignment(.center)
                        Text("éco-responsable")
                            .gradientForeground(colors: [Color("rouge"), Color("violet")])
                                                    .font(Font.custom("Revalia", size: 15))
                                                    .multilineTextAlignment(.center)
                        Text("Nombre d'étoiles à gagner")
                            .font(.custom("SFUIDisplay-Light", size: 18))
                                               .foregroundColor(Color("bleuNuit"))
                                               .multilineTextAlignment(.center)
                            .padding(.top, 20)
                        HStack {
                            Image("ptsEtoile")
                                .resizable()
                                .aspectRatio(contentMode: .fit
                                )
                                .frame(height: 40)
                            Image("ptsEtoile")
                                .resizable()
                                .aspectRatio(contentMode: .fit
                                )
                            Image("ptsEtoile")
                                .resizable()
                                .aspectRatio(contentMode: .fit
                                )
                        }
                        Button(action: {
                            popUpIsActive3.toggle()
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 100, height: 30)
                                    .foregroundColor(Color("violet"))
                                    .clipShape(Capsule())
                                Text("Go")
                                    .foregroundColor(.white)
                            }
                            
                        }).padding()
                    }.padding(.top, 20)
                    
                )
        } else if rotationState < -218 && rotationState > -237 || rotationState < -218 - 360 && rotationState > -237 - 360   {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.white)
                .frame(width: 300, height: 210)
                .opacity(0.8)
                .overlay(
                    VStack {
                        Text("La géometrie pour")
                            .gradientForeground(colors: [Color("rouge"), Color("violet")])
                            .padding(.top, 30)
                            .font(Font.custom("Revalia", size: 15))
                                                    .multilineTextAlignment(.center)
                            
                        Text("pour construire des")
                            .gradientForeground(colors: [Color("rouge"), Color("violet")])
                                                    .font(Font.custom("Revalia", size: 15))
                                                    .multilineTextAlignment(.center)
                        Text("maisons")
                            .gradientForeground(colors: [Color("rouge"), Color("violet")])
                                                    .font(Font.custom("Revalia", size: 15))
                                                    .multilineTextAlignment(.center)
                       
                        Text("Nombre d'étoiles à gagner")
                            .font(.custom("SFUIDisplay-Light", size: 18))
                                               .foregroundColor(Color("bleuNuit"))
                                               .multilineTextAlignment(.center)
                            .padding(.top, 20)
                        HStack {
                            Image("ptsEtoile")
                                .resizable()
                                .aspectRatio(contentMode: .fit
                                )
                                .frame(height: 40)
                            Image("ptsEtoile")
                                .resizable()
                                .aspectRatio(contentMode: .fit
                                )
                                
                            Image("ptsEtoile")
                                .resizable()
                                .aspectRatio(contentMode: .fit
                                )
                            Image("ptsEtoile")
                                .resizable()
                                .aspectRatio(contentMode: .fit
                                )
                        }
                        Button(action: {
                            popUpIsActive.toggle()
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 100, height: 30)
                                    .foregroundColor(Color("violet"))
                                    .clipShape(Capsule())
                                Text("Go")
                                    .foregroundColor(.white)
                            }
                            
                        }).padding()
                    }.padding(.bottom, 20)
                    
                )
        }else if rotationState < -303 && rotationState > -320 || rotationState < -303 - 360 && rotationState > -320 - 360  {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.white)
                .frame(width: 300, height: 210)
                .opacity(0.8)
                .overlay(
                    VStack {
                        Text("L'évolution du vivant pour")
                            .gradientForeground(colors: [Color("rouge"), Color("violet")])
                                                    .font(Font.custom("Revalia", size: 15))
                                                    .multilineTextAlignment(.center)
                        Text("créer un potager")
                            .gradientForeground(colors: [Color("rouge"), Color("violet")])
                                                    .font(Font.custom("Revalia", size: 15))
                                                    .multilineTextAlignment(.center)
                        Text("éco-responsable")
                            .gradientForeground(colors: [Color("rouge"), Color("violet")])
                                                    .font(Font.custom("Revalia", size: 15))
                                                    .multilineTextAlignment(.center)
                        Text("Nombre d'étoiles à gagner")
                            .font(.custom("SFUIDisplay-Light", size: 18))
                                               .foregroundColor(Color("bleuNuit"))
                                               .multilineTextAlignment(.center)
                            .padding(.top, 20)
                        HStack {
                            Image("ptsEtoile")
                                .resizable()
                                .aspectRatio(contentMode: .fit
                                )
                                .frame(height: 40)
                            Image("ptsEtoile")
                                .resizable()
                                .aspectRatio(contentMode: .fit
                                )
                            Image("ptsEtoile")
                                .resizable()
                                .aspectRatio(contentMode: .fit
                                )
                        }
                        Button(action: {
                            popUpIsActive3.toggle()
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 100, height: 30)
                                    .foregroundColor(Color("violet"))
                                    .clipShape(Capsule())
                                Text("Go")
                                    .foregroundColor(.white)
                            }
                            
                        }).padding()
                    }.padding(.top, 20)
            
                )
        } else {
            EmptyView()
        }
        } else {
            EmptyView()
        }
    }
}













struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        
        PlanetView(backButton: .constant(true), planet: PLANET10, player: PLAYER1, game: GAME1)
        
        
        
    }
}
