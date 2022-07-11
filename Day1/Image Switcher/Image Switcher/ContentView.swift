//
//  ContentView.swift
//  Image Switcher
//
//  Created by HyunMin Cho on 2022/07/11.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label:{
                    
                }
                Image("prev_d")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                Spacer()
                Text(" 1 / 5 ")
                Spacer()
                Image("next_p")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
            }
            Spacer()
            Image("lesserpanda")
                .resizable()
                .frame(width: 400, height: 500)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
            .previewInterfaceOrientation(.portrait)
    }
}
