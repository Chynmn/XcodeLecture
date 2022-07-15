//
//  GameModel.swift
//  MemoryGame
//
//  Created by HyunMin Cho on 2022/07/14.
//

import Foundation

struct Card {
    enum State {
        case removed, closed, open
    }
    var state: State
    let number: Int
}

class GameModel: ObservableObject { // GameView의 game에게(목적지) 짝지어서 변경을 알려줌
    static let rows = 5
    static let cols = 4
    
    @Published var cards = [Card]() //cards가 변경되면 다시 publish해라
    @Published var flips = 0
//    var cards: [Card] = [] 위와 같은 문장. Card array를 생성하영 변수 담는다.
    var openCardIndex: Int?
    private var count = 0
    var over: Bool {
        count == 0
    }
    
    func start () {     // fileprivate func => 클래스가 다르더라도 다른 것(함수)을 만들 때 같은 파일 내에서라면 불러와 사용 가능
        cards = []
//        count = 0
        
        let max = GameModel.rows * GameModel.cols / 2
        for i in 1 ... max {    // ...  =>  오른쪽 값을 포함,    ..<  => 오른쪽 값을 포함하지 않는다 == 미만
            cards.append(Card(state: .closed, number: i))
            cards.append(Card(state: .closed, number: i))
//            count +=2
        }
        count = cards.count
        flips = 0
        
        cards.shuffle()
    }
    
    init () {
        start()
    }
    func card(row: Int, col: Int) -> Card {  // showsModelAlert true false를 return하는 boolean함수
        cards[row * GameModel.cols + col]    // return 생략
    }
    func open(row: Int, col: Int) {
        let index = row * GameModel.cols + col
        if index == openCardIndex {
            return
        }
//        if openCardIndex == nil {
//            cards[index].state = .open
//        } else {
//            let num = cards[openCardIndex!].number
//            if num == cards[index].number {
//                cards[index].state = .removed
//                cards[openCardIndex!].state = .removed
//                openCardIndex = nil
//            } else {
//                cards[openCardIndex!].state = .closed
//                cards[index].state = .open
//                openCardIndex = index
//            }
//        }
        if let oci = openCardIndex {
            let num = cards[oci].number
            if num == cards[index].number {
                cards[index].state = .removed
                cards[oci].state = .removed
                openCardIndex = nil
                count -= 2
            } else {
                cards[oci].state = .closed
                cards[index].state = .open
                openCardIndex = index
                flips += 1
            }
        } else {
            cards[index].state = .open
            openCardIndex = index
            flips += 1
        }
    }
}

