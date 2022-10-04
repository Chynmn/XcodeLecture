//
//  MenuView.swift
//  MemoryGame
//
//  Created by HyunMin Cho on 2022/07/14.
//

import SwiftUI

struct MenuView: View {
    let prefixes = [ "f", "t", "z" ]
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(prefixes, id:\.self) { prefix in
                            MenuItemView(prefix: prefix)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(colors: [.white, .orange.opacity(0.5)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
            )
            .navigationTitle(
                Text("Memory Game")
            )
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuItemView: View {
    let prefix: String
    var body: some View {
        HStack {
            Image("\(prefix)_back")
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.4)
            Spacer()
            NavigationLink(destination: GameView(prefix: prefix)) {
                Text("Play Game")
                    .padding()
                    .background(
                        Capsule()
                            .stroke(lineWidth: 4)
                    )
            }
            Spacer()
        }
        .frame(height: 300)
        .background(
            ZStack{
                Color.white
                    .cornerRadius(25)
                    .padding(20)
                Image("\(prefix)_bg")
                    .resizable()
                    .padding(50)
            }
                .rotation3DEffect(.degrees(30), axis: (x: 0, y: -1, z: 0))
                .opacity(0.3)
        )
    }
}
