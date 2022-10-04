//
//  GridStack.swift
//  MemoryGame
//
//  Created by HyunMin Cho on 2022/07/13.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (_ row: Int, _ col: Int) -> Content
    var body: some View {
        VStack {
            ForEach (0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach (0 ..< columns, id: \.self) { col in
                        self.content(row, col)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
        }
    }
}

struct GridStack_Previews: PreviewProvider {
    static var previews: some View {
        GridStack(rows: 4, columns: 3) { r, c in
            Text("\(r), \(c)")
        }
    }
}
