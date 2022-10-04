// 클래스(class)와 객체(object instance)
import Foundation

// class안에는 변수나 함수를 포함할 수 있음.
class Animal {  // 속성값이 초기화되어 있지 않는 것을 허용하지 않음. 따라서 생성자를 호출해 준다.
    var legCount : Int = 0
//    init() {    // 생성자
//        legCount = 0
//    }
    var name: String = ""
    init(name: String) {
        self.name = name    //   동물의 이름을 정해주어야만 Animal객체를 생성할 수 있다.
    }
    func desc() -> String {
        //return "A(n) \(name) with \(legCount) legs"
        return "Animal(\(name) : \(legCount))"
    }
}


class Mammal: Animal {
    override init(name: String) {
        super.init(name: name)
        legCount = 4
    }
    func giveBirth() -> Mammal {
        Mammal(name: "Baby \(name)")
    }
}

class Dog: Mammal {
    func bark() -> String {
        "bark !!"
    }
    override func giveBirth() -> Mammal {
        return Dog(name: "Puppy \(name)")
    }
}

class Platypus: Mammal {
    override func giveBirth() -> Mammal {
        print("Laying an Egg")
        return Platypus(name: "Baby \(name) from an Egg")
    }
}

let animals = [
    Mammal(name: "Elephant"),
    Dog(name: "Jindol"),
    Platypus(name: "Pla")
]

class Monster: Mammal {
    var eyeCount = 0 {
        didSet {        // willSet, didSet => Property Observer
            legCount = 2 * eyeCount
        }
    }
    var showsImage = false {
        didSet {
            if showsImage {
                
            } else {
                
            }
        }
    }
    
    var kneeCount: Int {
        legCount        // return 생략
    }
//    var kneeCount: Int {
//        get {
//            return legCount
//        }
//    }
    var toeCount: Int {
        get {
            return 4 * legCount
        }
        set(v) {
            legCount = v / 4
        }
    }
}
let anims: [String:Mammal] = [:]    //  강의 자료 보고 recorrect해보기

// 코드 호출
let mo = Monster(name: "Kakaka")
mo.legCount = 40
mo.eyeCount
mo.eyeCount = 100
mo.kneeCount
mo.toeCount = 97
mo.kneeCount
mo.toeCount

// is - a relationship => 성립하는가?를 판별하는 관계어

for a in animals {
    print(a.desc())
    print(a.giveBirth().desc())
    if a is Platypus {  // if를 쓰는 분기를 개발자가 하지말자! 사용 지양
        ////
    } else if a is Dog {
        ////
    } else {
        ////
    }
}


//as    컴파일러와 개발자 모두 아는경우
//as?   컴파일러와 개발자 모두 모르기 때문에 optional로 선택하는 경우
//as!   컴파일러에게 강제로 개발자가 주장하는 경우

let jd = Dog(name: "Jindol")
jd.desc()
jd.bark()
let jj = jd.giveBirth() as? Dog
if jj != nil {
    jj!.desc()
    jj!.bark()
}
jj?.desc()   // nil이 아니기 때문에 호출이 가능하게 되었다.
jj?.bark()   // 컴파일러에게 as!를 이용하여 Dog를 강제하였다. 따라서 짖을 수 있게 되었다.

let m = Mammal(name: "Elephant")
m.desc()
let mm = m as? Dog      // 컴파일러야 Dog 객체가 맞을까? => 아니다.
let nd = mm?.desc()

//m.bark()

let child = m.giveBirth()
child.desc()
child.giveBirth().desc()

// encapsulation 데이터와 그 데이터를 다루는 동작(함수)를 묶어놓았기 때문에 함수만 따로 사용이 불가능함.

// member variable = field(메모리를 가지고 있음) = property(메모리 가지고 있지 않음) = attribute = data
// member function

let a = Animal(name: "Lark")
a.legCount
a.desc()
let b = Animal(name: "Elephant")
b.legCount = 4
b.desc()

