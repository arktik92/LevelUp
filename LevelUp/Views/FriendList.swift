//
//  FriendList.swift
//  LevelUp
//
//  Created by Lisa Mardjoeki on 21/06/2021.
//

import SwiftUI

struct myFriend: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var nbEtoile : String
}

struct FriendList: View {
    @State private var friendDetail = false
    @Binding var chatFriend : Bool
    
    var listFriends = [
        myFriend(name: "RockStar452", image: "alienProfil", nbEtoile: "53"),
        myFriend(name: "Michel48", image: "profil1", nbEtoile: "2"),
        myFriend(name: "54_Choopinette", image: "profil2", nbEtoile: "12"),
        myFriend(name: "Anonymousse", image: "profil3", nbEtoile: "26"),
        myFriend(name: "BurningBrain", image: "profil4", nbEtoile: "5"),
        myFriend(name: "EstinienW", image: "profil6", nbEtoile: "64"),
        myFriend(name: "JockerDLV", image: "profil5", nbEtoile: "1")
    ]
    
    var body: some View {
        ZStack {
            //BackgroundViews()
            // EN-TETE "MES AMIS" ------------------------
            VStack {
                HStack {
                    Text("Mes amis")
                        .gradientForeground(colors: [Color("rouge"), Color("violet")])
                        .font(Font.custom("Revalia", size: 25))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                    Spacer()
                    // Bouton fermeture de la modale
                    Button(action: {
                        chatFriend = false
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(.black)
                            .font(.title3)
                    })
                }.padding()
                
                Divider()
                
                // LISTE DES AMIS ------------------------
                List (listFriends){ friend in
                    Button(action: {
                        friendDetail = true
                    }, label: {
                        HStack {
                            Image(friend.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 65, height: 65, alignment: .center)
                                .padding(.trailing, 20)
                            VStack (alignment: .leading){
                                Text(friend.name)
                                    .font(Font.custom("Revalia", size: 20))
                                HStack{
                                    Text(friend.nbEtoile)
                                        .font(.title3)
                                    Image("ptsEtoile")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30, alignment: .center)
                                    Spacer()
                                }
                            }
                            Spacer()
                            Text(">")
                                .foregroundColor(.gray)
                        }
                    })
                }
                
            }
            // Affichage de la discussion -------
            if friendDetail {
                ChatView(friendDetail: $friendDetail).transition(.move(edge: .trailing))
                    .animation(.default)
            }
            
        }
    }
    
    struct FriendList_Previews: PreviewProvider {
        static var previews: some View {
            FriendList(chatFriend: .constant(true))
        }
    }
}
