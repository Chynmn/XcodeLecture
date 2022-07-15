import Foundation   // ios => UIKit, MacOs => Foundation

var arr = [ 3, 23, 43, 2, 564, 23, 6, 34, 6]
//arr.sort(by: <#T##(Int, Int) throws -> Bool#>) => 생략된 부분을 확인
arr.sort(by: { a, b in
    return a < b
})
// 위와 아래는 같은 표현. 따라서 swift에는 다양한 형태의 closure 인자 제공 방법이 있다.
arr.sort {
    $0 < $1
}
arr.sort()

arr

func points(num: Int, bonus: (Int)->Bool) -> Int {
    var pt = num * 10
    if bonus(num) {
        pt += 1
    }
    return pt
}

points(num: 9, bonus: { $0 % 3 == 0})
// 위와 아래는 같다. 함수의 마지막 인자가 closure인 경우 소괄호를 미리닫고, 마지막 인자를 중괄호로 표현 가능하다.
points(num: 9) { $0 % 3 == 0}

//Closure
points(num: 5, bonus: { (num: Int) -> Bool in
    return num % 2 != 0
})

// neg == negative
let neg = { ( n: Int) -> Bool in
    return n < 0
}

points(num: -2, bonus: neg)

let pos = { $0 > 0}    // return을 생략할 수 있는 경우.(수식이 생략되어있음)
pos(10)
pos(-20)
points(num: 10, bonus: pos)

func odd(num: Int) -> Bool {
    return num < 0
}

func negative(num: Int) -> Bool {
    return num < 0
}

points(num: 5, bonus: odd)
points(num: 6, bonus: odd)


func incrementor(num: Int) -> (() -> Int) {
    var value = 0
    func increase() -> Int {
        value += num    // value와 num의 값을 capture하고 있다.
        return value
    }
    return increase;
}

let inc3 = incrementor(num: 3)
inc3()
inc3()

let inc7 = incrementor(num: 7)
inc7()
inc7()

inc3()
