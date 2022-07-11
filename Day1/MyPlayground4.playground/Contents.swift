import UIKit
import Foundation

// 함수의 이름은 greet~name~day까지. String 2개를 인자로 받고 String을 return하는 함수
func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)"
}

func hello(a: String, b: String) -> String {
    return a + b
}

//let fff = greet
var fff = greet
let mm = fff("Kim", "Sunday")

fff = hello
// greet와 hello는 같은 타입의 함수. 따라서 함수도 타입이 될 수 있다는 아주 중요한 paradime. function block을 객체화한다.
let m2 = fff("Kim", "Sunday")



let msg1 = greet(name: "TUKorea", day: "Monday")
//let msg1 = greet("TUKOREA", "Monday")
let msg2 = greet(name: "CHynmn", day: "Great!")


// Tuple
let t1 = (10, 20)
t1.0
t1.1

let t2 = (x:10, y:20)
t2.x
t2.y

// '->' 함수의 반환타입.
func sum_mul(a: Int, b: Int) -> (Int, Int) {
    return (a+b, a*b)
}

let x = sum_mul(a: 10, b: 20)
let y = sum_mul(a: 100, b: 102)

