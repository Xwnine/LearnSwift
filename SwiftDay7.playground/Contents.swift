//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
class Counter {

    var count = 0
    //自加
    func increment()  {
        count += 1
        print(count)
    }
    //加上指定的值
    func incrementBy(amount: Int) {
        count += amount
        print(count)
    }
    //重置
    func reset() {
        count = 0
        print(count)
    }
}
let counter = Counter()
counter.increment()
counter.incrementBy(5)
counter.reset()

class AnotherCounter {

    var count: Int = 0
    func incrementBy(amount: Int,_ numberOfTimes: Int) {
        
        count += amount * numberOfTimes
        print(count)
    }
    
    func incrementByPramater(amount: Int,numberOfTimes: Int) {
        
        count += amount * numberOfTimes
        print(count)
    }

    func reset()  {
        count = 0
    }
}

let anotherCounter = AnotherCounter()
anotherCounter.incrementBy(9, 10)
anotherCounter.reset()
anotherCounter.incrementByPramater(9, numberOfTimes: 10)

struct Point {
    var x = 0.0
    var y = 0.0
    
    func isToTheRightOfX(x: Double) -> Bool {
        //结构体值和枚举是值类型。一般情况下，值类型的属性不能在它的实例方法中被修改
//        self.x = 9.0
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(1.0) {
    
    print("This point is to the right of the line where x == 1.0")
}

struct mutPoint {
    var x = 0.0, y = 0.0
    
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
    
        x += deltaX
        y += deltaY
    }
}

var mutablePoint = mutPoint(x: 1.0, y: 1.0)
mutablePoint.moveByX(2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

let fixedPoint = mutPoint(x: 3.0, y: 9.0)
//fixedPoint.moveByX(2.0, y: 3.0)

struct TestPoint {

    var x = 0.0, y = 0.0
    
    mutating func moveByX(deltaX:Double, y deltaY:Double) {
    
        self = TestPoint(x: x + deltaX, y: y + deltaY)
    }
}

enum TriStateSwitch {
    
    case Off, Low, High
    
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}

var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight.next()

struct LeverTracker {
    
    static var highestUnlockedLevel = 1
    //更新解锁等级
    static func unlockLevel(level: Int) {
    
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    //判断某个等级是否有解锁
    static func levellsUnlocked(level: Int) -> Bool {
        
        return level <= highestUnlockedLevel
    }
    
    var currentLevel = 1
    //实例方法，管理当前的currentLevel是否已经解锁
    mutating func advanceToLevel(level: Int) ->Bool {
    
        if LeverTracker.levellsUnlocked(level) {
            
            currentLevel = level
            return true
        }else {
            return false
        }
    }
}

class Player {

    var tracker = LeverTracker()
    let playerName:String
    
    func completedLevel(level:Int) {
        
        LeverTracker.unlockLevel(level+1)
        
        tracker.advanceToLevel(level + 1)
    }
    init(name: String) {
    
        playerName = name
    }
    
    class func totalLevel() -> Int{
    
       return LeverTracker.highestUnlockedLevel
    }
}

var player = Player(name: "Andrew")
player.completedLevel(3)
print(LeverTracker.highestUnlockedLevel)

player = Player(name: "Swift")
if player.tracker.advanceToLevel(6) {

    print("level 6 unlocked")
}else {

    print("level 6 not yet benn unlocked")
}
Player.totalLevel()


struct TimesTable {
    
    let multiplier: Int
    //下面其实是实现了getter
    subscript (index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("3的6倍是\(threeTimesTable[6])")

var numberOfLegs = ["spider":8, "ant": 6, "cat": 4];
numberOfLegs["bird"] = 2
numberOfLegs.keys.count

struct Matrix {
    
   let rows:Int, columns:Int
    
    var grid:[Double]

    init(rows: Int, columns: Int) {
        
        self.rows = rows
        self.columns = columns
        
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    
    func indexlsValidForRow(row: Int, column: Int) -> Bool {
        
        return row >= 0 && row < rows && column < columns
    }
    
    //下标脚本
    subscript(row: Int, column: Int) ->Double {
    
        get {
        
            assert(indexlsValidForRow(row, column: column), "index out of range")
            return grid[(row * columns) + column]
        }
        
        set {
        
            assert(indexlsValidForRow(row, column: column), "index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix.grid

//下标脚本
matrix[0, 1] = 1.5
matrix.grid
matrix[1, 0] = 3.2
matrix.grid

//下面的访问时错误的
//matrix.columns = 3
//matrix.rows = 3
//let someValue = matrix[2, 2]


class Vehicle {

    var currentSpeed = 0.0
    //提供一个getter方法
    var description:String {
    
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        print("make noise")
    }
}

let someValue = Vehicle()
print("Vehicle: \(someValue.description)")

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicyle = Bicycle()
bicyle.hasBasket = true
bicyle.currentSpeed = 15.0
print("Bicyle: \(bicyle.currentSpeed)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentSpeed = 25.0
tandem.currentNumberOfPassengers = 2

print("Tandem: \(tandem.description)")

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()
 class Car: Vehicle {
    var gear = 1
    //重写属性的getter方法
    override var description: String {
        return super.description + "in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 90.0
car.gear = 3
print("Car: \(car.description)", terminator: "")


class AutomaticCar: Car {

    override var currentSpeed: Double {
        didSet {
        
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 110
print("AutomicCar: \(automatic.description)")

struct Fahrenheit {
    var temperature: Double
    init () {
    
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature) Fahrenheit")


struct Celsius {

    var temperatureCelsius:Double
    //fromFahrenheit: 外部名，fahrenheit：内部名
    init(fromFahrenheit fahrenheit:Double) {
    
        temperatureCelsius = (fahrenheit - 32.0) / 1.8
        print("celsiur from Fahrenheit \(temperatureCelsius)")
    }

    init(fromKelvin kelvin: Double) {
    
        temperatureCelsius = kelvin - 273.15
        print("celsius from Kelvin \(temperatureCelsius)")
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)


struct Color {
    
    let red, green, blue:Double
    
    init(red: Double, green: Double, blue: Double) {
    
        self.red = red
        self.blue = blue
        self.green = green
    }
    
    init(white: Double) {
    
        red = white
        green = white
        blue = white
    }
    
//    init(white: Double) {
//        
//        self.red = white
//        self.green = white
//        self.blue = white
//    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
//有外部变量名而不写的话，会报错
//let halfGray = Color(0.5)
let halfGray = Color(white: 0.5)

struct AnotherCelsius {
    var temperature:Double = 0.0
    init(fromFahrenheit fahrenheit: Double) {
    
        temperature = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
    
        temperature = kelvin - 273.15
    }
    
    init(_ anotherCelsius: Double) {
        temperature = anotherCelsius
    }
}

let bodyTemperture = AnotherCelsius(37.0)


class SurveyQustion {
    
    let text: String
    
    var response:String?
    
    init(text: String) {
        
        self.text = text
    }
    
    func ask() -> String {
    
        return text
    }
}

let beetsQustion = SurveyQustion(text: "How about beets")
beetsQustion.ask()
beetsQustion.response = "I like beets"



























