//
//  ContentView.swift
//  Sample1
//
//  Created by HyunMin Cho on 2022/07/11.
//

import SwiftUI

struct BorderedShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .border(Color.green, width: 3)
            .shadow(color: Color.gray, radius: 5, x: 2, y: 5)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Button{
                print("Hi")
            } label:{
                Image(systemName: "poweroff")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
            }
            Spacer()    // 빈공간 채우기
            ExtractedView()
                .modifier(BorderedShadow())
            Spacer()
            Image("lesserpanda")
            Spacer()
            Image(systemName: "folder.badge.plus")
                .resizable()
                .frame(width: 60, height: 50)
                .foregroundColor(Color.accentColor)
                .padding()
                .border(Color.green, width: 8)
                .shadow(color: Color.gray, radius: 5, x: 0, y: 5)
            
            Image(systemName: "cursorarrow.click")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(Color.white)
            Image("cat")
                .modifier(BorderedShadow())

            Text("Hello, world!")
                //.font(.largeTitle)
                .font(.custom("Copperplate", size: 30))
                .padding()
                .background(Color.yellow)
        }
        .padding()
        .background(Color.purple)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}

struct ExtractedView: View {
    var body: some View {
        HStack {
            Text("현진.K")
            Text("Hello, world!")
                .background(Color.blue)
                .padding(5)
        }
    }
}
