import Foundation
// Enumeration
// lowerCamelCase 첫글자를 소문자로 쓰되 단어를 대문자로 구분 / UpperCamelCase 첫글자를 대문자로 쓰고 그 뒤는 소문자로 구분
enum Rank: Int {
    case ace = 1, two, three, four, five    // ace에 1을 줘서 한 칸씩 밀어줌
    case six, seven, eight, nine, ten
    case jack, queen, king
    
    func desc() -> String { // Rawtype     // enum안에서 함수 선언도 가능하다.
        //"\(self)"
        switch self {
        case .ace:
            return "Ace"
        case .jack: return "Jack"
        case .queen: return "Queen"
        case .king: return "King"
        default:
            return "\(self.rawValue)"   // "Know not"
        }
    }
}

var r = Rank.ten // 정수가 아님
//r = .seven
//r = .king
r.rawValue

r.desc()
Rank.nine.desc()

let x = Rank.ace    // Rank.으로 참조할 부분을 알려줘야 11번줄 처럼 생략 가능함

func printRank(rank: Rank) {
    print("I dont't know")
}

printRank(rank: r)
printRank(rank: .king)  // 함수를 통해 Rank임을 미리 알려주었으므로 생략 가능함
//Some()
//    .hello()
//    .world(.king)                       // Rank 생략
//    .font(.custom("Copperplate", 30))   // Font 생략

r.desc()    // enum안의 함수 호출

enum Response { //각 케이스마다 value가 association 된다.
    case result(String, String)
    case error(String)
}

let res1 = Response.error("Not ready")
let res2 = Response.result("Kim", "Seoul")

// Struct -> Value Type(read only) 멀티코어 환경에서 좋은 성능을 가짐. 따라서 멀티코어 환경에서는 class보다 struct  지향
// class -> Reference Type [ex)C언어]
//int a = 10
//int b = a
//b = 20

// Property Wrapper
@propertyWrapper
struct FixCase {
    private(set) var value: String = ""
    var wrappedValue: String {
        get { value }
        set { value = newValue.uppercased() }
    }
    init(wrappedValue initialValue: String) {
        self.wrappedValue = initialValue
    }
}

//struct Address {
//    private var _city: String = ""
//    var city: String {
//        get { _city }
//        set(v) { _city = v.uppercased() }
//    }
//    var name: String
//    var country: String
//}
struct Address {
    @FixCase var city: String
    @FixCase var name: String
    @FixCase var country: String
}

var seoul = Address(city: "Seoul", name: "Kim", country: "Korea")
//seoul.city = "Seoul"
seoul.city
seoul.name
seoul.country

