//
//  GemeEndPopUp.swift
//  LevelUp
//
//  Created by Mac n°26 on 11/06/2021.
//
import AVFoundation
import SwiftUI

struct PopUpEndOfGame: View {
    let player : Player
    let game: Game
    var win: Bool
    @Binding var score: Int
    @Binding var popUpIsActive: Bool
    @Binding var startGame: Bool
    @Binding var isValidate: Bool
    @State private var winSon : AVAudioPlayer?
    @State private var lose : AVAudioPlayer?
    @State private var sonValidate: AVAudioPlayer?
    @EnvironmentObject var points : Player
    var body: some View {
        let pathWin = Bundle.main.path(forResource: "you_win.mp3", ofType:nil)!
        let urlWin = URL(fileURLWithPath: pathWin)
        let pathLose = Bundle.main.path(forResource: "you_lose.mp3", ofType:nil)!
        let urlLose = URL(fileURLWithPath: pathLose)
        let pathValidate = Bundle.main.path(forResource: "SonBouton2.mp3", ofType:nil)!
        let urlValidate = URL(fileURLWithPath: pathValidate)
        if win{
            ZStack{
                BackgroundRectangle(color: "vert")
                VStack{
                    
                    Spacer()
                    
                    Text("Félicitations")
                        .font(Font.custom("Revalia", size: 28))
                        .foregroundColor(.white)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 8, x: 4, y: 4)
                    Spacer()
                    
                    Image("trophy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 170, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal,50)
                    Spacer()
                    
                    HStack{
                        Text("Tu a gagné \(game.nbEtoile)")
                            .font(Font.custom("Revalia",size:26))
                            .foregroundColor(.white)
                            .fixedSize(horizontal: true, vertical: false)
                        Image("ptsEtoile")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }.shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 8, x: 4, y: 4)
                    Text("Score : \(score) %")
                        .font(Font.custom("Revalia",size:26))
                        .foregroundColor(.white)
                        .fixedSize(horizontal: true, vertical: false)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 8, x: 4, y: 4)
                    Spacer()
                    
                    

                    Button(){
                        //Retour vers planète ou univers ??
                        startGame = false
                      isValidate = false
                        popUpIsActive = false
                      
                        do {
                            sonValidate = try AVAudioPlayer(contentsOf: urlValidate)
                            sonValidate?.play()
                        } catch {
                            // couldn't load file :(
                        }
                       
                        points.totalEtoile += game.nbEtoile
                        points.totalPtsPro += Double(game.nbPtsPro)
                        points.totalPtsPra += Double(game.nbPtsPra)
                        points.totalPtsDevPer += Double(game.nbPtsDevPer)
                        points.totalPtsQuo += Double(game.nbPtsQuo)
                        points.totalPtsHyg += Double(game.nbPtsHyg)
                        points.totalPtsSur += Double(game.nbPtsSur)
                        points.achievedGame.append(game.gameName)
                        playSound(sound: "SonAccueil", type: "mp3")
                    }label:{
                        Text("Génial")
                            .font(Font.custom("Revalia", size: 22))
                            .foregroundColor(.white)
                            .padding(.vertical,15)
                            .padding(.horizontal,50)
                            .background(Color("violet"))
                            .cornerRadius(35)
                    }.shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 8, x: 4, y: 4)
                    Spacer()
                }.frame(width: 350, height: 450, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(15)
                
            }.onAppear{
                do {
                    winSon = try AVAudioPlayer(contentsOf: urlWin)
                    winSon?.play()
                } catch {
                    // couldn't load file :(
                }
            }
        }else{
            ZStack{
                BackgroundRectangle(color:"rouge")
                VStack{
                    
                    Spacer()
                    
                    Text("Courage !")
                        .font(Font.custom("Revalia", size: 28))
                        .foregroundColor(.white)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 8, x: 4, y: 4)
                        
                    Spacer()
                    
                    Image("trophy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 170, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal,50)
                        .rotationEffect(Angle(degrees: 200))
                    
                    Spacer()
                    
                    HStack{
                        Text("Tu y es presque")
                            .font(Font.custom("Revalia",size:26))
                            .foregroundColor(.white)
                    }.shadow(color: .black, radius: 8, x: 4, y: 4)
                    
                    Spacer()
                    
                    Button(){
                        //Retour vers planète ou univers ??
                        startGame = false
                      isValidate = false
                        popUpIsActive = false
                      
                        do {
                            sonValidate = try AVAudioPlayer(contentsOf: urlValidate)
                            sonValidate?.play()
                        } catch {
                            // couldn't load file :(
                        }
                        playSound(sound: "SonAcceuil", type: "mp3")
                    }label:{
                        Text("C'est reparti !")
                            .fixedSize(horizontal: true, vertical: false)
                            .font(Font.custom("Revalia", size: 22))
                            .foregroundColor(.white)
                            .padding(.vertical,15)
                            .padding(.horizontal,50)
                            .background(Color("violet"))
                            .cornerRadius(35)
                    }.shadow(color: .black, radius: 8, x: 4, y: 4)
                    Spacer()
                }.frame(width: 350, height: 450, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(15)
                
            }.onAppear{
                do {
                    lose = try AVAudioPlayer(contentsOf: urlLose)
                    lose?.play()
                } catch {
                    // couldn't load file :(
                }
            }
        }
    }
}

struct PopUpEndOfGame_Previews: PreviewProvider {
    static var previews: some View {
        PopUpEndOfGame(player: PLAYER1, game: GAME1, win: true, score: .constant(0), popUpIsActive: .constant(true), startGame: .constant(true), isValidate: .constant(true))
    }
}
