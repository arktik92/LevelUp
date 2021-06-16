//
//  Connexion.swift
//  LevelUp
//
//  Created by Laura LONG on 14/06/2021.
//
import Firebase
import SwiftUI
import AuthenticationServices
import GameKit

struct Connexion: View {
    
    @StateObject var loginData = LoginModel()
    @State private var username: String = ""
    @State private var password = ""
    @State private var showField : Bool = false
    @State private var user: User?
    @State private var showMain: Bool = false
    @State private var isGamecenterTapped = false
    var body: some View {
        
        ZStack {
            Color("bleuNuit")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Image("fondEtoile")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                Image("levelup")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                if showField == true {
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                        TextField("Ton adresse e-mail", text: $username)
                            .keyboardType(.emailAddress)
                            .disableAutocorrection(true)
                            .foregroundColor(Color("bleuNuit"))
                            .font(.custom("SFUIDisplay-Light", size: 18))
                            .background(Color(.white))
                            .cornerRadius(20)
                            .multilineTextAlignment(.center)
                    }.foregroundColor(.white)
                    .frame(height: 70, alignment: .center)
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                        SecureField("Ton mot de passe", text: $password)
                            .disableAutocorrection(true)
                            .foregroundColor(Color("bleuNuit"))
                            .font(.custom("SFUIDisplay-Light", size: 18))
                            .background(Color(.white))
                            .cornerRadius(20)
                            .frame(height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.center)
                    }.foregroundColor(.white)
                    .frame(height: 70, alignment: .center)
                    
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
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.white)
                                .frame(width: 100, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .overlay(
                                    Text("Connexion")
                                )
                        }) .fullScreenCover(isPresented: $showMain, content: {
                            ModalConnexionValid()
                        })
                    } else {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.gray)
                            .frame(width: 100, height: 40)
                            .overlay(
                                Text("Connexion")
                            )
                    }
                    
                    
              
                    
                    
                }
                
                Button(action: {
                    self.showField.toggle()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.white)
                            .frame(height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                        HStack {
                            Image("arrobase")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                            Text("Connexion avec ton email")
                                .font(.custom("SFUIDisplay-Light", size: 18))
                                .foregroundColor(Color("bleuNuit"))
                                .padding(.horizontal, 30)
                        }
                        
                    }
                })
                
                
                Button(action: {
                    self.isGamecenterTapped.toggle()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.white)
                            .frame(height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                        HStack {
                            Image("logogamecenter")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Text("Connexion avec Game Center")
                                .font(.custom("SFUIDisplay-Light", size: 18))
                                .foregroundColor(Color("bleuNuit"))
                                .padding(.horizontal, 30)
                        }
                        
                    }
                }).fullScreenCover(isPresented: $isGamecenterTapped, content: {
                    ConnectionView()
                })
                
                
                Spacer()
                
                
                
                
                SignInWithAppleButton(.signIn) { request in
                    
                    loginData.nonce = randomNonceString()
                    request.requestedScopes = [.email, .fullName]
                    request.nonce = sha256(loginData.nonce)
                    
                } onCompletion: { result in
                    
                    switch result {
                    case .success(let user):
                        print("succes")
                        guard let credential = user.credential as? ASAuthorizationAppleIDCredential else {
                        print("error with firebase")
                        return
                        }
                        loginData.authenticate(credential: credential)
                    case .failure(let error):
                        print(error.localizedDescription)
                   
                    }
                }.signInWithAppleButtonStyle(.white)
                .frame(height: 70, alignment: .center)
                .clipShape(Capsule())
                      
               Spacer()
                
                
                
                
                
            }
            
        }
    }

}


struct Connexion_Previews: PreviewProvider {
    static var previews: some View {
        Connexion()
    }
}
