//
//  Game1.swift
//  LevelUp
//
//  Created by Lisa Mardjoeki on 16/06/2021.
//

import SwiftUI

struct Game1: View {
    var body: some View {
        
        // SCROLLVIEW EXPLICATIONS --------------------------------
        VStack {
            ScrollView {
                VStack(alignment: .center){
                    
                    // Introduction sur la PLS -------
                    Text("Position : P.L.S\r🆘")
                        .font(Font.custom("Revalia", size: 25).bold())
                        .multilineTextAlignment(.center)
                    HStack{
                        Text("P.L.S?")
                            .font(Font.title2.bold())
                            .foregroundColor(.red)
                        Text("Position Latérale de Sécurité")
                    }
                    Text("Lorsqu'un accident survient, on te parle souvent de la position \"PLS\".").italic()
                    Text("A quoi sert-elle? Et en quoi consiste t'elle vraiment?").bold().padding()
                    
                    //Utilité de la PLS avec texte et image -------
                    subtitleView(subtitle: "Utilité de la PLS")
                    Text("Lorsqu’une personne est au sol, inconsciente et qu’elle respire, il ne faut pas la laisser sur le dos afin d’éviter que ses voies respiratoires ne soient obstruées par des vomissements ou par sa langue. Il s’agit avant tout de limiter les risques d’étouffement avant l’arrivée des secours, qu’il faut alerter en premier lieu.").multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).padding()
                    
                    
                    //Procédure pour la PLS --------
                    subtitleView(subtitle: "Procédure")
                    VStack(alignment: .leading){
                        checkPLS(numberImage: "1.circle", checkText: "Vérifier l'état de conscience de la victime")
                        checkPLS(numberImage: "2.circle", checkText: "Vérifier que la victime respire")
                        checkPLS(numberImage: "3.circle", checkText: "Libérer les voies aériennes")
                        checkPLS(numberImage: "4.circle", checkText: "Aligner les jambes dans l’axe du corps")
                        checkPLS(numberImage: "5.circle", checkText: "Lever le bras de la victime à 90° par rapport au corps")
                        checkPLS(numberImage: "6.circle", checkText: "Fléchir le bras et la jambe opposés")
                        checkPLS(numberImage: "7.circle", checkText: "Basculer la victime sur le côté")
                        checkPLS(numberImage: "8.circle", checkText: "Maintenir la bouche ouverte")
                        checkPLS(numberImage: "9.circle", checkText: "Surveiller la respiration et l'état de conscience de la victime en attendant l’arrivée des secours")
                        Image("positionPLS")
                    }.padding(.top)
                    
                    // Une petite video pour finir --------
                    subtitleView(subtitle: "Une vidéo explicative")
                    Link("Mettre une personne en PLS", destination: URL(string: "https://www.youtube.com/watch?v=NIAmZJDca_s")!)
                    
                }
            }
            .padding()
            .background(Color(.white))
            .cornerRadius(40)
            .frame(width: 350, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}


//subView pour les sous-titres
struct subtitleView: View {
    var subtitle: String
    var body: some View {
        HStack {
            Text(subtitle)
                .font(Font.custom("Revalia", size: 17).bold())
            Spacer()
        }.gradientForeground(colors: [Color(.red), Color(.black)])
    }
}

//subView pour chaque étape de la procédure
struct checkPLS: View {
    var numberImage: String
    var checkText: String
    var body: some View {
        HStack(alignment: .top){
            Image(systemName: numberImage)
            Text(checkText).multilineTextAlignment(.leading)
        }
    }
}

struct Game1_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            GameBackground()
            Game1()
        }
        
    }
}
