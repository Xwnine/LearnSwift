//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
enum CompassPoint {

    case North
    case South
    case East
    case West
}

enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

var directtionToHead = CompassPoint.West
directtionToHead = .East
//directionToHead type of CompassPoint
//directtionToHead = Plent.Earth

directtionToHead = .South

switch directtionToHead {
    
    case .North:
        print("Lots of plantes have a north")
    case .South:
        print("Watch out for penguins")
    case .East:
        print("Where the sun rises")
    case .West:
        print("Where the skies are blue")
    default:
        break
}
let somePlanet = Planet.Earth

switch somePlanet {

    case .Earth:
        print("\(somePlanet) is mostly harmless")
    default:
        print("\(somePlanet) isn't safe for humans")
}

//给枚举成员关联值
enum BarCode {
    
    case UPCA(Int, Int, Int, Int)
    case SCode(String)
}

var productBarCode = BarCode.UPCA(8, 85909, 51226, 3)
productBarCode = .SCode("ABCD QRCode")

//提取每个成员的每个关联值作为一个常量
switch productBarCode {
    case .UPCA(let numberSystem, let manufacture, let product, let check):
        print("UPC-A: \(numberSystem), \(manufacture), \(product), \(check)")
        
    case .SCode(let productCode):
        print("QR Code: \(productCode)")

}

//枚举成员的所有关联值都被提取为常量，或者都被提取为变量，为了简洁，可以在成员名称之前标注一个let 或者var
switch productBarCode {
    case let .UPCA(numberSys, manuf, product, check):
        print("\(numberSys), \(manuf), \(product), \(check)")
    case let .SCode(productBarCode):
        print("\(productBarCode)")
}

//枚举成员的原始值，需要制定原始值的type
enum ASCIIControlCharacter:Character {
    
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}
//省略原始值
enum PlanetWithValue:Int {

    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturm, Uranus, Neptune
}

enum CompassValue :String {
    case North, South, East, West
}

let earthOrder = PlanetWithValue.Earth.rawValue
let sunestDirection = CompassValue.West.rawValue
//取到的值是一个optional的，可能会为nil
let possibleValue = PlanetWithValue(rawValue: 7)


let positionToFind = 9
if let somePlanet = PlanetWithValue(rawValue:positionToFind) {
    switch somePlanet {
        case .Earth:
            print("Mostly harmlwss")
        default:
            print("Not a safe place for humans")
    }
}else {
    print("There isn't a planet at position \(positionToFind)")
}

enum AirthmeticExpression {
    case Number(Int)
    indirect case Addition(AirthmeticExpression, AirthmeticExpression)
    indirect case Multiplication(AirthmeticExpression, AirthmeticExpression)
}

//所有枚举成员都可是可递归的
indirect enum MathteicExpression {
    case Number (Int)
    case Addition(MathteicExpression, MathteicExpression)
    case Multiplication(MathteicExpression, MathteicExpression)
}

/**
 根据给定的参数返回对应的数学计算结果
 
 - parameter expression: MatheicExpression
 
 - returns: Int
 */
func evaluate(expression: MathteicExpression) -> Int {
    switch expression {
        case .Number(let value):
            return value
        case .Addition(let left, let right):
            return evaluate(left) + evaluate(right)
        case .Multiplication(let left, let right):
            return evaluate(left) * evaluate(right)
    }
}

//计算（5 + 4）* 2
let five = MathteicExpression.Number(5)
let four = MathteicExpression.Number(4)
let sum =  MathteicExpression.Addition(five, four)
let product = MathteicExpression.Multiplication(sum, MathteicExpression.Number(2))

print("sunm")
print(evaluate(four))
print(evaluate(sum))
print(MathteicExpression.Number(10))
print(evaluate(MathteicExpression.Number(20)))
print(evaluate(MathteicExpression.Addition(MathteicExpression.Number(1), MathteicExpression.Number(9))))
print(evaluate(product), terminator: "")


class SomeClass {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String?
}

struct Resolution {
    var width = 0
    var height = 0
}

let videoMode = SomeClass()
let videoResoltion = Resolution()
videoMode.resolution = videoResoltion
print("The width of videoResoltion is \(videoResoltion.width)")
print("The width of videoMode is \(videoMode.resolution.width)")
videoMode.resolution.width = 1280

print("The width of videoMode is \(videoMode.resolution.width)")
//结构体成员的逐一构造
let vga = Resolution(width: 640, height: 720)
let hd = Resolution(width: 1920, height: 1080)
//cinema是hd的一个副本并非hd本身,
var cinema = hd
print("cinema width \(cinema.width)")
cinema.width = 2048
print("cinema width \(cinema.width)")

//拷贝的过程中，实际上是将该hd中所存储的值进行拷贝，然后将拷贝的数据存储到新的cinema中。结果就是连个完全独立的实例。
var hdCopy = Resolution(width: 1920, height: 1080)
cinema = hdCopy
print("cinema width \(cinema.width)")
hdCopy.width = 0
print("cinema width \(cinema.width)")



































