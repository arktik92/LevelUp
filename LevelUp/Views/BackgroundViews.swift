//
//  BackgroundViews.swift
//  LevelUp
//
//  Created by Laura LONG on 16/06/2021.
//

import SwiftUI

struct BackgroundViews: View {
    @State var rotationStar = false
    var body: some View {
        
        Color("bleuNuit").onAppear { rotationStar = true}
            .overlay(EtoileView(imgEtoile: "etoileFond1", wEtoile: 30, hEtoile: 30, posX: 100, posY: 40)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 0.5)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond2", wEtoile: 30, hEtoile: 30, posX: 300, posY: 80)
                        .rotationEffect(.degrees(rotationStar ? 0 : 360))
                        .animation(Animation.linear(duration: 100)
                                            .repeatForever(autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond5", wEtoile: 30, hEtoile: 30, posX: 370, posY: 90)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 5)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond3", wEtoile: 30, hEtoile: 50, posX: 270, posY: 240)
            )
            .overlay(EtoileView(imgEtoile: "etoileFond4", wEtoile: 30, hEtoile: 30, posX: 170, posY: 340))
            .overlay(EtoileView(imgEtoile: "etoileFond1", wEtoile: 30, hEtoile: 30, posX: 100, posY: 40)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 0.8)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond2", wEtoile: 30, hEtoile: 30, posX: 320, posY: 60))
            .overlay(EtoileView(imgEtoile: "etoileFond5", wEtoile: 30, hEtoile: 30, posX: 470, posY: 110)
                        .rotationEffect(.degrees(rotationStar ? 0 : 360))
                        .animation(Animation.linear(duration: 100)
                                            .repeatForever(autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond3", wEtoile: 30, hEtoile: 30, posX: 370, posY: 10))
            .overlay(EtoileView(imgEtoile: "etoileFond2", wEtoile: 30, hEtoile: 30, posX: 270, posY: 440)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 0.1)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond3", wEtoile: 30, hEtoile: 30, posX: 250, posY: 400))
            .overlay(EtoileView(imgEtoile: "etoileFond3", wEtoile: 50, hEtoile: 50, posX: 30, posY: 400)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 0.9)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond5", wEtoile: 30, hEtoile: 30, posX: 100, posY: 400))
            .overlay(EtoileView(imgEtoile: "etoileFond5", wEtoile: 30, hEtoile: 30, posX: 150, posY: 500)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 1)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond5", wEtoile: 30, hEtoile: 60, posX: 150, posY: 500)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 6)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond5", wEtoile: 30, hEtoile: 30, posX: 250, posY: 510)
                        .rotationEffect(.degrees(rotationStar ? 0 : 360))
                        .animation(Animation.linear(duration: 100)
                                            .repeatForever(autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond1", wEtoile: 30, hEtoile: 30, posX: 10, posY: 500))
            .overlay(EtoileView(imgEtoile: "etoileFond2", wEtoile: 30, hEtoile: 30, posX: 200, posY: 180)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 10)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond5", wEtoile: 30, hEtoile: 30, posX: 170, posY: 690))
            .overlay(EtoileView(imgEtoile: "etoileFond3", wEtoile: 30, hEtoile: 30, posX: 260, posY: 740)
                        .rotationEffect(.degrees(rotationStar ? 0 : 360))
                        .animation(Animation.linear(duration: 100)
                                            .repeatForever(autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond4", wEtoile: 30, hEtoile: 30, posX: 170, posY: 340)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 0.1)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond1", wEtoile: 30, hEtoile: 30, posX: 300, posY: 800)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 1)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond2", wEtoile: 30, hEtoile: 30, posX: 320, posY: 60))
            .overlay(EtoileView(imgEtoile: "etoileFond5", wEtoile: 30, hEtoile: 30, posX: 260, posY: 110)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 0.9)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond3", wEtoile: 30, hEtoile: 30, posX: 20, posY: 700))
            .overlay(EtoileView(imgEtoile: "etoileFond3", wEtoile: 30, hEtoile: 30, posX: 30, posY: 760)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 0.3)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond2", wEtoile: 30, hEtoile: 30, posX: 270, posY: 440))
            .overlay(EtoileView(imgEtoile: "etoileFond3", wEtoile: 30, hEtoile: 30, posX: 50, posY: 600)
                        .rotationEffect(.degrees(rotationStar ? 360 : 0))
                        .animation(Animation.linear(duration: 100)
                                            .repeatForever(autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond3", wEtoile: 30, hEtoile: 30, posX: 60, posY: 200)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 3)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond5", wEtoile: 60, hEtoile: 60, posX: 55, posY: 100)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 7)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond5", wEtoile: 30, hEtoile: 30, posX: 150, posY: 500)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 5)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond5", wEtoile: 30, hEtoile: 30, posX: 150, posY: 500))
            .overlay(EtoileView(imgEtoile: "etoileFond5", wEtoile: 30, hEtoile: 30, posX: 250, posY: 510))
            .overlay(EtoileView(imgEtoile: "etoileFond5", wEtoile: 50, hEtoile: 50, posX: 350, posY: 610)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 2)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond3", wEtoile: 60, hEtoile: 30, posX: 230, posY: 610)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 1)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond2", wEtoile: 30, hEtoile: 30, posX: 85, posY: 280))
            .overlay(EtoileView(imgEtoile: "etoileFond3", wEtoile: 40, hEtoile: 40, posX: 350, posY: 300))
            .overlay(EtoileView(imgEtoile: "etoileFond4", wEtoile: 30, hEtoile: 30, posX: 310, posY: 200)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 10)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .overlay(EtoileView(imgEtoile: "etoileFond2", wEtoile: 50, hEtoile: 50, posX: 160, posY: 790))
            .overlay(EtoileView(imgEtoile: "etoileFond2", wEtoile: 30, hEtoile: 30, posX: 340, posY: 490)
                        .opacity(rotationStar ? 1 : 0)
                        .animation(Animation.linear(duration: 4)
                                            .repeatCount(rotationStar ? Int.max : 0, autoreverses: true)))
            .ignoresSafeArea()
        
    }
}

struct BackgroundViews_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundViews()
    }
}



struct EtoileView: View {
    
    var imgEtoile : String
    var wEtoile : CGFloat
    var hEtoile : CGFloat
    var posX : CGFloat
    var posY :CGFloat
    
    
    
    var body: some View {
        Image(imgEtoile)
            .resizable()
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(width: wEtoile, height: hEtoile, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .position(x: posX, y: posY)
    }
}

