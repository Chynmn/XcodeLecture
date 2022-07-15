//
//  ContentView.swift
//  MemoryGame
//
//  Created by HyunMin Cho on 2022/07/13.
//

import SwiftUI

struct GameView: View {
    var prefix: String
    @ObservedObject var game = GameModel()
    @Environment(\.presentationMode) var present
    
    @State var showsRestartAlert = false   // shows~ : 3인친 변수 => true false 값을 넣음(Boolean)
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Memory Game")
                Spacer()
                Text("Flips: \(game.flips)")
            }
            .padding(.horizontal)    // 가로방향으로 추가
            GridStack(rows: GameModel.rows, columns: GameModel.cols) { row, column in
                CardView(prefix: prefix, card: game.card(row: row, col: column))
                    .gesture(
                        TapGesture().onEnded {  // 카드를 탭하여 카드를 뒤집는 기능
                            game.open(row: row, col: column)
                            if game.over {
                                showsRestartAlert = true
                            }
                        }
                    )
            }
            .aspectRatio(CGSize(width: GameModel.cols, height: GameModel.rows), contentMode: .fit)
            HStack {
                Spacer()
                Button {
                    present.wrappedValue.dismiss()
                } label: {
                    Text("Back")
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .stroke(lineWidth: 2.0)
                        )
                }
                Spacer()
                Button {
                    showsRestartAlert = true
                } label: {
                    Text("Restart")
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .stroke(lineWidth: 2.0)
                        )
                }
                Spacer()
            }
            Spacer()
        }
        .background(
            LinearGradient(colors: [.white, .blue.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .alert(isPresented: $showsRestartAlert) {
            Alert(
                title: Text("Restart?"),
                message: Text("Do you want to restart the game?"),
                primaryButton: .default(Text("Restart")) {       // 오른쪽 버튼
                    game.start()
                },
                secondaryButton: .cancel()      // 왼쪽 버튼
            )
        }
        .navigationBarHidden(true)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(prefix: "f")
    }
}
