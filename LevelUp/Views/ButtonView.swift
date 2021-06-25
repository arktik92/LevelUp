//
//  ButtonBiew.swift
//  LevelUp
//
//  Created by Mac n°26 on 23/06/2021.
//

import SwiftUI
import AVFoundation

struct ButtonView: View {
    @State private var sonValidate: AVAudioPlayer?
    @Binding var counter : Int
    var question : Question{
        return quiz[counter]
    }
    @Binding var juste : Double
    @State var quiz : [Question]
    @Binding var score: Int
    @Binding var isValidateWin: Bool
    @Binding var isValidateLose: Bool
    
    var body: some View {
        let pathValidate = Bundle.main.path(forResource: "SonValidation.mp3", ofType:nil)!
        let urlValidate = URL(fileURLWithPath: pathValidate)
        Button(action:{ withAnimation(.default){
            if juste/Double(quiz.count) >= 0.5{
                isValidateWin.toggle()
            }
            else if juste/Double(quiz.count) < 0.5{
                isValidateLose.toggle()
            }
            do {
                sonValidate = try AVAudioPlayer(contentsOf: urlValidate)
                sonValidate?.play()
            } catch {
                // couldn't load file :(
            }
            if question.selectedInt == quiz[counter].reponse{
                juste += 1
            }
            score = Int(juste/(Double(quiz.count))*100)
            counter=0
            juste=0
            
        }},
        label:{
            
            Text("Valider")
                .foregroundColor(.white)
                .padding(.horizontal,50)
                .padding(.vertical,12)
                .background(Color("rouge"))
                .cornerRadius(30)
                .font(.custom("SFUIDisplay-Light", size: 23))
                .shadow(color: .black, radius: 10, x: 5, y: 5)
            
        })
    }
}


