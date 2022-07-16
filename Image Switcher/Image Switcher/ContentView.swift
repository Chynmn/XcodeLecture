//
//  ContentView.swift
//  Image Switcher
//
//  Created by HyunMin Cho on 2022/07/11.
//

import SwiftUI

struct ContentView: View {
    @State var pageNumber = 1
    var body: some View {
        VStack {
            HStack {
                Button {
                    if pageNumber > 1 {
                    pageNumber -= 1
                    }
                } label: {
                    Image("prev_d")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding()
                }
                Spacer()
                Text(" \(pageNumber) / 5 ")
                Spacer()
                Button {
                    if pageNumber < 5 {
                    pageNumber += 1
                    }
                } label: {
                    Image("next_p")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding()
                }
                
            }
            Spacer()
            Image("lesserpanda")
                .resizable()
                .frame(width: 300, height: 300)
            Spacer()
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
