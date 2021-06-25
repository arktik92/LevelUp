//
//  QuestionView.swift
//  LevelUp
//
//  Created by Mac n°26 on 14/06/2021.
//

import SwiftUI

struct QuestionView: View {
    @Binding var counter : Int
    var question : Question{
        return quiz[counter]
    }
    @EnvironmentObject var points : Player
    @State var quiz : [Question]
    @Binding var juste : Double
    @State var completed : Bool = false
    let value = ["A","B","C","D","E","F"]
    var body: some View {
        GeometryReader { geo in
            VStack(alignment:.leading){
                
                ForEach(0 ..< question.reponses.count) { reponse in
                    HStack(spacing:30){
                        Text(value[reponse])
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal,7)
                            .background(LinearGradient(gradient: Gradient(colors: [Color("rouge"),Color("violet")]), startPoint: .top, endPoint: .bottom))
                            .cornerRadius(50)
                            .font(.custom("SFUIDisplay-Heavy", size: 20))
                        
                        Button(){
                            quiz[counter].selectedInt = reponse
                            
                        }label:{
                            Text(question.reponses[reponse])
                                .font(.custom("SFUIDisplay-Light", size: 20))
                                .padding()
                                .foregroundColor(.white)
                                .background((question.selectedInt == reponse) ? Color("rouge") : Color("bleuNuit"))
                                .cornerRadius(50)
                                .fixedSize(horizontal: false, vertical: true)
                            
                        }
                        
                    }.frame(maxWidth:.infinity,alignment:.center)
                }
                Spacer().frame(height:20)
                if counter<quiz.count-1{
                    Button(){
                        
                        if question.selectedInt == quiz[counter].reponse{
                            juste+=1
                        }
                        counter+=1
                        playSound(sound: "SonValidation", type: "mp3")
                    }label:{
                        Text("Suite")
                            .foregroundColor(.white)
                            .padding(.horizontal,50)
                            .padding(.vertical,12)
                            .background(Color("vert"))
                            .cornerRadius(30)
                            .font(.custom("SFUIDisplay-Light", size: 23))
                    }.frame(maxWidth:.infinity,alignment:.center)
                }
            }.frame(maxWidth:.infinity)
        }
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            GameBackground(gamePlanet: PLANET2, gameTitle: "test")
            QuestionView(counter: .constant(0), quiz: QuizPotager,juste:.constant(0))
                .previewLayout(.sizeThatFits)
        }
    }
}
struct PageSwipe: View {
    var label: String
    @Binding var counter : Int
    let quiz : [Question]
    var body: some View {
        HStack(spacing: 20) {
            if counter>0{
                Button {
                    counter = max(0, counter - 1)
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                .buttonStyle(PlainButtonStyle())
            }
            Text("Question \((counter+1).description)")
            if counter<quiz.count-1{
                Button {
                    counter += 1
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }.padding()
        .background(Color(.systemGray5))
        .font(.custom("SFUIDisplay-Light", size: 22))
        
    }
}
