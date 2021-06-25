//
//  SignInEmail.swift
//  LevelUp
//
//  Created by esteban semellier on 16/06/2021.
//

import SwiftUI
import Firebase

struct SignInEmail: View {
    @Binding var showField: Bool
    @Binding var username: String
    @Binding var password: String
    @Binding var showMain: Bool
    @Binding var user: User?
    var body: some View {
        VStack {
            Button(action: {
                self.showField.toggle()
            }, label: {
                
                ZStack {
                    Rectangle()
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .frame(width: 350, height: 50, alignment: .center)
                            .padding()
                            .overlay(
                        HStack {
                            Image("arrobase")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30, alignment: .center)
                            Text("Connexion avec ton email")
                                .font(.custom("SFUIDisplay-Light", size: 18))
                                .foregroundColor(Color("bleuNuit"))
                                .padding(.horizontal, 10)
                        }
                        )
                }
                
            })
            if showField == true {
                ZStack{
                    Rectangle()
                        .clipShape(Capsule())
                    TextField("Ton adresse e-mail", text: $username)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .foregroundColor(Color("bleuNuit"))
                        .font(.custom("SFUIDisplay-Light", size: 18))
                        .background(Color(.white))
                        .cornerRadius(20)
                        .multilineTextAlignment(.center)
                }.foregroundColor(.white)
                .frame(width: 300, height: 50, alignment: .center)
                ZStack {
                    Rectangle()
                        .clipShape(Capsule())
                    SecureField("Ton mot de passe", text: $password)
                        .disableAutocorrection(true)
                        .foregroundColor(Color("bleuNuit"))
                        .font(.custom("SFUIDisplay-Light", size: 18))
                        .background(Color(.white))
                        .cornerRadius(20)
                        .multilineTextAlignment(.center)
                }.foregroundColor(.white)
                .frame(width: 300, height: 50, alignment: .center)
                if username != "" && password.count > 4 {
                    Button(action: {
                        Auth.auth().signIn(withEmail: username, password: password) { (authDataResult, error) in
                            if error != nil {
                                print(error!.localizedDescription)
                            } else {
                                if let user = authDataResult?.user {
                                    self.user = user
                                    self.showMain = true
                                }
                            }
                        }
                    }, label: {
                        Spacer()
                        ZStack {
                            Rectangle()
                                .clipShape(Capsule())
                                .foregroundColor(Color("violet"))
                                .frame(width: 150, height: 50, alignment: .center)
                                .padding()
                                .overlay(
                            Text("Se connecter")
                                .foregroundColor(.white)
                            )
                        }
                    }) .fullScreenCover(isPresented: $showMain, content: {
                        Universe(myPlayer: PLAYER1, planetList: MY_PLANETS)
                    })
                } else {
                    ZStack {
                        Rectangle()
                            .clipShape(Capsule())
                            .foregroundColor(Color("violet"))
                            .frame(width: 150, height: 50, alignment: .center)
                            .padding()
                            .overlay(
                        Text("Se connecter")
                                    .foregroundColor(.white)
                                
                        )
                    }
                }
            }
        }
    }
}



