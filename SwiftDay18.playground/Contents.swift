//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol TextRepresentable {
    var textualDescription:String {
    
        get
    }
}

protocol PrettyTextRepresentable: TextRepresentable {
    //新增一个属性
    var prettyTextualDescription: String {
        get
    }
}

class SnakesAndLadders{
    
    let square = 10;
}


//extension SnakesAndLadders: PrettyTextRepresentable {
//
//    var prettyTextualDescription: String {
//    
//        var output = textualDescription + ":\n"
//        
//    }
//}

protocol Named {
    var name: String {get}
}

protocol Aged {
    var age: Int {get}
}

struct Person: Named, Aged {
    var name: String
    var age:Int
}

//协议的合成
func wishHappyBirthday(celebrator: protocol<Named, Aged>) {
    print("Happy birthday \(celebrator.name) - youre \(celebrator.age)!")
}

let andrew = Person(name: "MacPro", age: 21)
wishHappyBirthday(andrew)

protocol HasArea {
    var area: Double {get}
}

class Circle: HasArea {

    let pi = 3.1415926
    
    var radius: Double
    //将HasArea的属性实现为计算属性
    var area: Double {
    
        return pi * radius * radius
    }
    
    init(radius: Double) {
    
        self.radius = radius
    }
}

class Country: HasArea {

    var area: Double
    //将HasArea的属性实现为存储属性
    init(area: Double) {
    
        self.area = area
    }
}

class Animal {

    var legs: Int
    init(legs: Int) {
    
        self.legs = legs
    }
}

//AnyObject：用来表示任意的class类型的实例
//Any：用来表示任意类型，甚至包括方法（func）类型


let objects:[AnyObject] = [Circle(radius: 2.0),
                           Country(area: 2390_6200),
                           Animal(legs: 12)]

for object in objects {

    if let objectWithArea = object as? HasArea {
    
        print("Area is \(objectWithArea.area)")
        
    }else {
    
        print("something that doesn't hava a area")
    }
}

@objc protocol CounterDataSource {

    optional func incrementForCount(count: Int) -> Int
    optional var fixedIncrement: Int {get}
}

class Counter {

    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
    
        if let amount = dataSource?.incrementForCount?(count){
        
            count += amount
        }else if let amount = dataSource?.fixedIncrement {
        
            count += amount
        }
    }
}

class ThreeSource: NSObject, CounterDataSource {

    let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()

for _ in 1...4 {

    counter.increment()
    print(counter.count)
}

@objc class TowardsZeroSource:NSObject, CounterDataSource {

    func incrementForCount(count: Int) -> Int {
        
        if count == 0 {
        
            return 0
        }else if count < 0 {
        
            return 1
        }else {
        
            return -1
        }
    }
}

counter.count = -4;
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {

    counter.increment()
    print(counter.count)
}

protocol RandomNumberGenertor {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenertor {

    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}

extension RandomNumberGenertor {

    func randomBool() -> Bool {
        return random() > 0.5
    }
}

let generator = LinearCongruentialGenerator()
print("Here is a number:\(generator.random())")
print("And here's a random Boolean: \(generator.randomBool())")

extension CollectionType where Generator.Element: TextRepre












































