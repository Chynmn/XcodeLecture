//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by HyunMin Cho on 2022/07/13.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    var body: some Scene {
        WindowGroup {
            //GameView(prefix: "f")  // 차후에 MenuView를 넣고 사용자의 선택에 따라 화면 이동
            MenuView()
        }
    }
}
