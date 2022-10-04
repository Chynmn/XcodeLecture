//
//  CaedView.swift
//  MemoryGame
//
//  Created by HyunMin Cho on 2022/07/13.
//

import SwiftUI

struct CardView: View {
//    enum CardState {
//        case removed, closed, open
//    }
    var prefix: String
    var card: Card
    var timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    @State var frameIndex = 1
    var body: some View {
//        let imageName = prefix + String(format: "_%02d_01", num)  => 18번 줄이 더 swift스러운 방법
        if card.state == .removed {
            Image(systemName: "x.circle")
                .resizable()
//                .aspectRatio(contentMode: .fit) // 가로세로 비율 맞춤
                .opacity(0.1)   // 투명도
        } else {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onReceive(timer) { _ in
//                    NSLog("on timer receive")
                    frameIndex += 1
//                    if frameIndex > 8 {
                    let img = UIImage(named: imageName)
                    if img == nil {
                        frameIndex = 1
                    }
                }
        }
    }
    var imageName: String {
        if card.state == .closed {
            return prefix + "_back"
        }
        return prefix + String(format: "_%02d_%02d", card.number, frameIndex)
    }
}

struct CaedView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ForEach(1..<6) {num in
                HStack {
                    CardView(prefix: "z", card: Card(state: .open, number: num))
                    CardView(prefix: "z", card: Card(state: .open, number: num+5))
                }
            }
        }
    }
}
