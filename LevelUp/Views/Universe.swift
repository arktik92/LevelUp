//
//  Univers.swift
//  LevelUp
//
//  Created by Laura LONG on 11/06/2021.
//
import AVFoundation
import SwiftUI
import AuthenticationServices
import GameKit

struct Universe: View {
    @State private var sonValidate : AVAudioPlayer?
    @State private var backButton = false
    @State var showPlayerProfile = false
    @State var showTutorial = false
    @EnvironmentObject var points : Player
    @State var rotationPlanets = false
    var myPlayer : Player
    var planetList : [Planet]
    @State var pass = false
    let localPlayer = GKLocalPlayer.local
    //work
    @State private var rotationPlanet = false
    //    init() {
    //
    //        UINavigationBar.appearance().barTintColor = .clear
    //        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    //   return
    //    }
    //FONCTION AUTHENTICATEUSER
    func authenticateUser() {
        localPlayer.authenticateHandler = { vc, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            GKAccessPoint.shared.isActive = localPlayer.isAuthenticated
        }
    }
    
    //BODY
    var body: some View {
        let pathValidate = Bundle.main.path(forResource: "SonBouton1.mp3", ofType:nil)!
        let urlValidate = URL(fileURLWithPath: pathValidate)
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                BackgroundViews()
                Image("alien2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: .center)
                    .offset(y: rotationPlanet ? 800 : -800)
                    .animation(Animation.easeInOut(duration: 9).repeatForever(autoreverses: true))
                Image("alien1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: .center)
                    .offset(x: rotationPlanet ? -1000 : 800)
                    .scaleEffect(rotationPlanet ? 3 : -1)
                    .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true))
                Image("alien3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: .center)
                    .offset(x: rotationPlanet ? 700 : -800, y: rotationPlanet ? 300 : -900)
                    
                    .animation(Animation.linear(duration: 20).repeatForever(autoreverses: true))
                Image("rocket")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: .center)
                    .offset(x: rotationPlanet ? -700 : 800, y: rotationPlanet ? 500 : -800)
                    .animation(Animation.linear(duration: 10).repeatForever(autoreverses: false))
                
                ScrollView ([.horizontal, .vertical], showsIndicators: false){
                    
                    VStack(alignment: .leading){
                        //FIRST ROW ------------------
                        HStack (spacing: 80){
                            VStack{
                                onePlanet(planetImageName: "planetRouge", planetWidth: 100, planetHeight: 100)
                                    .padding()
                                    .rotationEffect(.degrees(rotationPlanet ? 0 : 360))
                                    .animation(Animation.linear(duration: 100).repeatForever(autoreverses: true))
                                Text("Maths")
                                    .font(.custom("Revalia", size: 20))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                            invisibleObject(invisibleWidth: 100, invisibleHeight: 100)
                            onePlanet(planetImageName: "planetVerte", planetWidth: 50, planetHeight: 50)
                                .frame(width: 40, height: 40, alignment: .center)
                                .rotationEffect(.degrees(rotationPlanet ? 0 : 360))
                                .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true))
                        }
                        
                        // SECOND ROW ----------------
                        HStack (spacing: 60) {
                            onePlanet(planetImageName: "planetRandom", planetWidth: 30, planetHeight: 30)
                                .padding(.top, 30)
                                .rotationEffect(.degrees(rotationPlanet ? 0 : 360))
                                .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false))
                            invisibleObject(invisibleWidth: 30, invisibleHeight: 30)
                            VStack{
                                onePlanet(planetImageName: "planetTerre", planetWidth: 150, planetHeight: 150)
                                    .rotationEffect(.degrees(rotationPlanet ? 360 : 0))
                                    .animation(Animation.linear(duration: 150).repeatForever(autoreverses: true))
                                Text("Litterature")
                                    .font(.custom("Revalia", size: 20))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                            invisibleObject(invisibleWidth: 30, invisibleHeight: 30)
                            VStack{
                                onePlanet(planetImageName: "planetAnneau2", planetWidth: 120, planetHeight: 120)
                                    .padding(.top, 90)
                                
                                Text("Art")
                                    .font(.custom("Revalia", size: 20))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        // THIRD ROW ------------------
                        HStack (spacing: 50){
                            Spacer()
                            onePlanet(planetImageName: "planetAnneau", planetWidth: 100, planetHeight: 100)
                                .rotationEffect(.degrees(-90))
                                .offset(x: rotationPlanet ? 2 : 15)
                                .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true))
                            Spacer()
                            NavigationLink(
                                destination: PlanetView(backButton: $backButton, planet: PLANET10, player: PLAYER1, game: GAME1),isActive: $backButton,
                                label: {
                                    VStack{
                                        onePlanet(planetImageName: "planetOr", planetWidth: 200, planetHeight: 200)
                                            .padding(.top, 150)
                                        
                                        Text("Sciences")
                                            .font(.custom("Revalia", size: 20))
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                    }
                                })
                            Spacer()
                            Spacer()
                            VStack{
                                onePlanet(planetImageName: "planetBulle", planetWidth: 150, planetHeight: 150)
                                    .offset(y: rotationPlanet ? 2 : 15)
                                    .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true))
                                Text("Géographie")
                                    .font(.custom("Revalia", size: 20))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        // FOURTH ROW ----------
                        HStack {
                            invisibleObject(invisibleWidth: 30, invisibleHeight: 30)
                            onePlanet(planetImageName: "planetGlace", planetWidth: 110, planetHeight: 110).padding(90)
                            VStack{
                                onePlanet(planetImageName: "planetRandom", planetWidth: 200, planetHeight: 150).padding(.top, 100)
                                    .rotationEffect(.degrees(rotationPlanet ? 360 : 0))
                                    .animation(Animation.linear(duration: 150).repeatForever(autoreverses: true))
                                Text("Au Pif")
                                    .font(.custom("Revalia", size: 20))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                            invisibleObject(invisibleWidth: 50, invisibleHeight: 50)
                            onePlanet(planetImageName: "planetTerre", planetWidth: 40, planetHeight: 40)
                            
                            
                        }
                        
                        //FIFTH ROW ----------
                        HStack {
                            VStack{
                                onePlanet(planetImageName: "planetVerte", planetWidth: 150, planetHeight: 150)
                                Text("Histoire")
                                    .font(.custom("Revalia", size: 20))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                            
                            invisibleObject(invisibleWidth: 150, invisibleHeight: 150)
                            Image("rocket")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .offset(y: rotationPlanet ? 3 : -2)
                                .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
                        }
                    }
                }
            }.onAppear {
                rotationPlanet = true
                authenticateUser()
                perform: do {
                    playSound(sound: "SonAcceuil", type: "mp3")
                }
                audioPlayer?.numberOfLoops = -1
            }
            
            .navigationBarItems(leading: HStack{
                                    Image("ptsEtoile")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 60, height: 60, alignment: .center)
                                    
                                    Text("\(points.totalEtoile)")
                                        .foregroundColor(.white)
                                        .font(.custom("Revalia", size: 30))}
                                ,trailing:
                                    HStack{
                                        SoundButton()
                                        
                                        Button(action: {
                                            showTutorial.toggle()
                                        }, label: {
                                            Image("info")
                                        })
                                        
                                        Button(action: {
                                            showPlayerProfile.toggle()
                                            do {
                                                sonValidate = try AVAudioPlayer(contentsOf: urlValidate)
                                                sonValidate?.play()
                                            } catch {
                                                // couldn't load file :(
                                            }
                                            
                                        }, label: {
                                            Image("astroProfil")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .padding()
                                                .frame(width: 70, height: 70, alignment: .center)
                                        })
                                    })
            
            
        }
        .fullScreenCover(isPresented: $showPlayerProfile, content: {
            PlayersProfile(showPlayerProfile: $showPlayerProfile, player: PLAYER1)
            
        })
        .fullScreenCover(isPresented: $showTutorial, content: {
            Tutorial(showTutorial: $showTutorial)
        })
    }
}

//Evite de ré-écrire les modifiers resizable, aspect et frame
struct onePlanet: View {
    var planetImageName : String
    var planetWidth: CGFloat
    var planetHeight: CGFloat
    var body: some View {
        Image(planetImageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: planetWidth, height: planetHeight)
    }
}

//permet de créer des équivalents Spacer, car les Spacer() ne fonctionnant pas dans les éléments de la ScrollView
struct invisibleObject: View {
    var invisibleWidth: CGFloat
    var invisibleHeight: CGFloat
    var body: some View {
        onePlanet(planetImageName: "planetOr", planetWidth: invisibleWidth, planetHeight: invisibleHeight).opacity(0)
    }
}

struct Universe_Previews: PreviewProvider {
    static var previews: some View {
        
        Universe(myPlayer: PLAYER1, planetList: MY_PLANETS)
            .previewDevice("iPhone 12")
            .environmentObject(Player())
          
        
    }
}
struct SoundButton: View {
    
    @State private var soundOff = false
    
    var body: some View {
        Button(action: {
            if soundOff {
                audioPlayer?.play()
            }else{
                audioPlayer?.pause()
                
            }
            
            soundOff.toggle()
        }, label: {
            Image(systemName:(soundOff ? "speaker.slash": "speaker.wave.2"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        })
    }
}
extension View {
    /// to modify the navBar attributes , title , bar color , and Translucent
    func navBarModifier(largeTitleColor: Color, smallTitleColor: Color,
                        isTranslucent: Bool, barStyle: UIBarStyle,
                        navBackgroundColor: Color = .clear, tintColor: Color = .clear,
                        userInterfaceStyle : UIUserInterfaceStyle = .unspecified) -> some View {
        return self.onAppear{
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: largeTitleColor.uiColor()]
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: smallTitleColor.uiColor()]
            UINavigationBar.appearance().isTranslucent = isTranslucent
            UINavigationBar.appearance().barStyle = barStyle
            UINavigationBar.appearance().backgroundColor = navBackgroundColor.uiColor()
            UINavigationBar.appearance().tintColor = tintColor.uiColor()
            UINavigationBar.appearance().overrideUserInterfaceStyle = userInterfaceStyle
        }
    }
}
extension Color {
    func uiColor() -> UIColor {
        if #available(iOS 14.0, *) {
            return UIColor(self)
        }
        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }
    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
    }
}
