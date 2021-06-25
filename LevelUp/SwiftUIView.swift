//
//  SwiftUIView.swift
//  LevelUp
//
//  Created by esteban semellier on 21/06/2021.
//

import SwiftUI

struct SwiftUIView: View {
    var posenetManager: PoseNetManager = PoseNetManager()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                posenetManager.observeImage(imageName: "homme")
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
