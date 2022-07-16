//
//  ContentView.swift
//  MoreControls
//
//  Created by HyunMin Cho on 2022/07/12.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0
    @State var userName: String = ""
    @State var angle = 0.0
    var body: some View {
        VStack {
            Text("Name: \(userName), Count: \(count)")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.green)
                .padding()
                .rotationEffect(Angle.degrees(angle))
                .animation(.easeIn(duration: 0.5), value: angle)
            Text("Angle: \(angle)")
            Image(systemName: "pencil.tip.crop.circle.badge.arrow.forward")
                .font(.largeTitle)
            Button {
                count += 1
            } label: {
                Image(systemName: "goforward.plus")
                    .font(.largeTitle)
            }
            TextField("Enter your name here", text: $userName)  //$(바인딩)
                .frame(width: 200)
            Slider(value: $angle, in: 0 ... 360)
                .frame(width: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
