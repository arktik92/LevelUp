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
                         .gradientForeground(colors: [Color("rouge"), Color("violet")])
                        .multilineTextAlignment(.center)
                    HStack{
                        Text("P.L.S.?")
                            .foregroundColor(.red)
                            .font(.custom("SFUIDisplay-Heavy", size: 18))
                           
                        Text("Position Latérale de Sécurité")
                            .font(.custom("SFUIDisplay-Heavy", size: 18))
                            .foregroundColor(Color("bleuNuit"))
                    }
                    Text("Lorsqu'un accident survient, on te parle souvent de la position \"PLS\".").italic()
                        .foregroundColor(Color("bleuNuit"))
                    Text("A quoi sert-elle? Et en quoi consiste t'elle vraiment?")
                        .font(.custom("SFUIDisplay-Heavy", size: 16))
                        .foregroundColor(Color("bleuNuit"))
                        .padding()
                    
                    //Utilité de la PLS avec texte et image -------
                    subtitleView(subtitle: "Utilité de la PLS")
                    Text("Lorsqu’une personne est au sol, inconsciente et qu’elle respire, il ne faut pas la laisser sur le dos afin d’éviter que ses voies respiratoires ne soient obstruées par des vomissements ou par sa langue. Il s’agit avant tout de limiter les risques d’étouffement avant l’arrivée des secours, qu’il faut alerter en premier lieu.")
                        .font(.custom("SFUIDisplay-Light", size: 18))
                        .foregroundColor(Color("bleuNuit"))
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).padding()
                    
                    
                    //Procédure pour la PLS --------
                    subtitleView(subtitle: "Procédure")
                    VStack(alignment: .leading){
                        checkPLS(numberImage: "1.circle", checkText: "Vérifier l'état de conscience de la victime")
                            .font(.custom("SFUIDisplay-Light", size: 18))
                            .foregroundColor(Color("bleuNuit"))
                        checkPLS(numberImage: "2.circle", checkText: "Vérifier que la victime respire")
                            .font(.custom("SFUIDisplay-Light", size: 18))
                            .foregroundColor(Color("bleuNuit"))
                        checkPLS(numberImage: "3.circle", checkText: "Libérer les voies aériennes")
                            .font(.custom("SFUIDisplay-Light", size: 18))
                            .foregroundColor(Color("bleuNuit"))
                        checkPLS(numberImage: "4.circle", checkText: "Aligner les jambes dans l’axe du corps")
                            .font(.custom("SFUIDisplay-Light", size: 18))
                            .foregroundColor(Color("bleuNuit"))
                        checkPLS(numberImage: "5.circle", checkText: "Lever le bras de la victime à 90° par rapport au corps")
                            .font(.custom("SFUIDisplay-Light", size: 18))
                            .foregroundColor(Color("bleuNuit"))
                        checkPLS(numberImage: "6.circle", checkText: "Fléchir le bras et la jambe opposés")
                            .font(.custom("SFUIDisplay-Light", size: 18))
                            .foregroundColor(Color("bleuNuit"))
                        checkPLS(numberImage: "7.circle", checkText: "Basculer la victime sur le côté")
                            .font(.custom("SFUIDisplay-Light", size: 18))
                            .foregroundColor(Color("bleuNuit"))
                        checkPLS(numberImage: "8.circle", checkText: "Maintenir la bouche ouverte")
                            .font(.custom("SFUIDisplay-Light", size: 18))
                            .foregroundColor(Color("bleuNuit"))
                        checkPLS(numberImage: "9.circle", checkText: "Surveiller la respiration et l'état de conscience de la victime en attendant l’arrivée des secours")
                            .font(.custom("SFUIDisplay-Light", size: 18))
                            .foregroundColor(Color("bleuNuit"))
                        Image("positionPLS")
                    }.padding(.top)
                    
                    // Une petite video pour finir --------
                    subtitleView(subtitle: "Une vidéo explicative")
                    Link("Mettre une personne en PLS", destination: URL(string: "https://www.youtube.com/watch?v=NIAmZJDca_s")!)
                    
                }
            }
            .padding()
            .background(Color(.white).opacity(0.8))
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
            GameBackground( gameTitle: "")
            Game1()
        }
        
    }
}
