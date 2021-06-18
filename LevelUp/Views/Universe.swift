//
//  Univers.swift
//  LevelUp
//
//  Created by Laura LONG on 11/06/2021.
//

import SwiftUI
import AuthenticationServices
import GameKit

struct Universe: View {
    @EnvironmentObject var points : Player
    @State var rotationPlanets = false
    var myPlayer : Player
    var planetList : [Planet]
    @State private var isMoving = false
    @State var pass = false
    let localPlayer = GKLocalPlayer.local
    func authenticateUser() {
        localPlayer.authenticateHandler = { vc, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            GKAccessPoint.shared.isActive = localPlayer.isAuthenticated
        }
    }
    var body: some View {
        NavigationView {
            
            
            ZStack(alignment: Alignment(horizontal:
                                            .center, vertical: .bottom)) {
                BackgroundViews()
                
            }
            .overlay(
                VStack {
                    
                    Image("soucoupe")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 10, height: 10)
                        .offset(x: isMoving ? -200: -60, y: isMoving ? 320 : -250)
                        .scaleEffect(isMoving ? 4 : -2)
                    
                    //planette vers la Droite
                    Image("planetBulle")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 10, height: 10)
                        .offset(x: isMoving ? 200: 0, y: isMoving ? 320 : 20)
                        .scaleEffect(isMoving ? 4 : 1)
                    NavigationLink(
                        destination: PlanetView(planet: PLANET10, player: PLAYER1),
                        label: {
                            Image("planetOr")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 50, height: 50)
                        }).offset(x: isMoving ? 250: 30, y: isMoving ? 320 : 80)
                        .scaleEffect(isMoving ? 4 : 2)
                    
                    NavigationLink(
                        destination: PlanetView(planet: PLANET12, player: PLAYER1),
                        label: {
                    Image("planetAnneau")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 50, height: 50)
                        .animation(.linear .delay(3.0))
                        }) .offset(x: isMoving ? 350: -60, y: isMoving ? 320 : -130)
                        .scaleEffect(isMoving ? 6 : 0)
                    
                    Image("planetAnneau2")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 50, height: 50)
                        .offset(x: isMoving ? 120 : 100, y: isMoving ? 320 : -130)
                        .scaleEffect(isMoving ? 4 : 0.5)
                    
                    //Planete vers la Gauche
                    
                    Image("planeteTerre")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 50, height: 50)
                        .offset(x: isMoving ? -150: -60, y: isMoving ? 320 : -100)
                        .scaleEffect(isMoving ? 4 : 0)
                    
                    Image("planetGlace")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 100, height: 100)
                        .offset(x: isMoving ? -150 : -120, y: isMoving ? 320 : 0)
                        .scaleEffect(isMoving ? 4 : 1)
                    
                    Image("planetRouge")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 50, height: 50)
                        .offset(x: isMoving ? -100: -30, y: isMoving ? 320 : -300)
                        .scaleEffect(isMoving ? 3 : 1.25)
                    
                    Image("planetVerte")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 50, height: 50)
                        .offset(x: isMoving ? -150 : -60, y: isMoving ? 320 : -290)
                        .scaleEffect(isMoving ? 4 : 1)
                    
                    Button("Avancer") {
                        withAnimation (.linear(duration: 10)) {
                            isMoving.toggle()
                        }
                    }
                    .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                    
                }
                .ignoresSafeArea()
            )
            .navigationBarHidden(true)
            .onAppear {
                authenticateUser()
            }
            
        }
    }
}

struct Universe_Previews: PreviewProvider {
    static var previews: some View {
        
        Universe(myPlayer: PLAYER4, planetList: MY_PLANETS)
            .previewDevice("iPhone 12")
            .environmentObject(Player())
        
    }
}
