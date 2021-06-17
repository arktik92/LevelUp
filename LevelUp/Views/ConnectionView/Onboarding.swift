//
//  Onboarding.swift
//  LevelUp
//
//  Created by Laura LONG on 11/06/2021.
//

import SwiftUI

struct Onboarding: View {
    
    @State private var animationSoucoup = false
    
    let guideLine : String = "Embarque dans l'univers et découvre des choses pratiques avec des connaissances que tu sais déjà !"
    
    
    var body: some View {
        ZStack{
            BackgroundViews()
    
        VStack{
            Spacer()
            Image("levelup")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
            Spacer()
            if animationSoucoup == true {
                ZStack {
                    Text(guideLine)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .font(.custom("SFUIDisplay-Light", size: 20))
                        .frame(width: 320, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                        .animation(Animation.easeInOut(duration: 3).delay(3))
                }
                
            } else  {
    
            }
            Spacer()
            Image("soucoupe")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 500, height: 200, alignment: .leading)
                .scaleEffect(animationSoucoup ? 0 : 1.0)
                .animation(.easeInOut(duration: 3.0))
                .onAppear() {
                    self.animationSoucoup.toggle()
                }
            Spacer()
            
            
        }
    }
    
    
}

}
struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}


