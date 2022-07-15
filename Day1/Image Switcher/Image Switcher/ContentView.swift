//
//  ContentView.swift
//  Image Switcher
//
//  Created by HyunMin Cho on 2022/07/11.
//

import SwiftUI

//struct TopButtonModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .font(.largeTitle)
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 60, height: 60)
//            .background(Color.mint)
//            .padding()
//    }
//}

struct TopButton: View {
    enum Dir { case left, right}
    var enabled: Bool
    var dir: Dir
    //var imageName: String
    var action: () -> Void
    var body: some View {
        var imageName: String = dir == .left ? "prev" : "next"
        if !enabled {
            imageName += "_d"
        }
        return Button {
            action()
        } label: {
            Image(imageName)
                .resizable()
                .font(.largeTitle)
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                //.foregroundColor(enabled ? Color.orange : Color.gray)
                .padding()
                    
        }
        .disabled(!enabled)
    }
}

struct ContentView: View {
    @State var pageNumber = 1
    var body: some View {
        VStack {
            HStack {
                TopButton(enabled: pageNumber > 1, dir: .left) {
                    pageNumber -= 1
                }
                .disabled(pageNumber == 1)
                Spacer()
                Text(" \(pageNumber) / 5 ")
                    .font(.largeTitle)
                Spacer()
                TopButton(enabled: pageNumber < 5, dir: .right) {
                    pageNumber += 1
                }
                .disabled(pageNumber == 5)
            }
            Spacer()
            Image("lesserpanda")
                .resizable()
                .frame(width: 400, height: 400)
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
