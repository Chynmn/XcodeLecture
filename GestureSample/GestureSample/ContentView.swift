//
//  ContentView.swift
//  GestureSample
//
//  Created by HyunMin Cho on 2022/07/13.
//

//Press, Move, Release
//LongPress
//Tap(Click) = Touch Up Inside
//Double Tap, Triple, ...
//Drag, Pan -> Translation
//Flick (Fling) - Decelerating
//Swipe -> Direction
//Pinch -> Scale
//Rotation -> Angle

import SwiftUI

struct ContentView: View {
    @State var spinning = false
    @State var visible = true
    @State var count = 0
    @GestureState var angle = Angle.zero
    var body: some View {
        let tap = TapGesture()
            .onEnded {
                count += 1
            }
//        let lpress = LongPressGesture()
//            .onEnded { _ in
//                count += 10
//            }
        let rot = RotationGesture()
            .updating($angle) { angle, state, transaction in
                state = angle
            }
//            .onChanged { angle in
//                print("Angle: \(angle)")
//                self.angle = angle
//            }
//            .onEnded { _ in
//                print("Rotation Ended")
//            }
        
        VStack {
            Text("count = \(count), angle = \(angle.degrees)")
            ZStack {
                Circle()
                    .stroke(.blue, lineWidth: 5)   // 외각선만 그리기
                    .background(Circle().fill(
                        RadialGradient(gradient: Gradient(colors: [Color.red, Color.yellow, Color.green]), center: .center, startRadius: 0, endRadius: 80)  // 그라데이션 효과
                    ))
                    .frame(width: 200, height: 200)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.red, lineWidth: 8)
                    .frame(width: 200, height: 70)
                Text("Tap me !!")
//                    .padding(50)
//                    .background(Color.yellow)
                    .gesture(tap)
                    .border(Color.red, width: 4)
                .rotationEffect(angle)
            }
            .rotationEffect(.degrees(spinning ? 360 : 0))
            .animation(
                .linear(duration: 1)
                .repeatForever(autoreverses: false),
                value: spinning ? 360 : 0)
            .onAppear {
                spinning = true
            }
//                    TapGesture()
//                        .onEnded {
//                            count += 1
//                        }
            
            Toggle(isOn: $visible.animation(.linear)) {  // isOn => 켰다껐다 하는 기능, label => view를 제공
                Text("Toggle Control")
            }
            .frame(width: 350)
            Button {
//                spinning = !spinning
            } label: {
                Text("Toggle Spinning")
                    .padding(10)
                    .background(
                        Capsule()
                            .stroke(.brown, lineWidth: 3)
                    )
            }
            Spacer()
            if visible {
                Path { path in
                    path.move(to: CGPoint(x:200, y: 0))
                    path.addLine(to: CGPoint(x:100, y:200))
                    path.addLine(to: CGPoint(x:300, y:200))
                //                path.addLine(to: CGPoint(x:200, y:0))
                //                path.closeSubpath()
                }
                .stroke(.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))  // 꼭지점에서 꺾을 때. 어떻게 할건지를 결정 cap:선의 양쪽 끝. Join: 꺾이는 꼭짓점
            }
            HStack {
                Image(systemName: "pencil.and.outline")
                    .resizable()
                    .frame(width: 50, height: 50)
//                Text("Long Press Me")
                Text("Rotate Me")
            }
            .padding(50)
            .background(LinearGradient(colors: [Color.yellow, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
//            .gesture(rot)
//                LongPressGesture()
//                    .onEnded { _ in   // '_' => 관심없다라는 뜻
//                        count += 10
//               }
            
        }
        .gesture(rot)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

