//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class ShoppingListItem {

    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()
item.name = "Shop list"

struct Size {
    
    var width = 0.0
    var height = 0.0
}

struct Point {
    
    var x = 0.0
    var y = 0.0
}
let twoByTwo = Size(width: 3.0, height: 9.0)

struct Rect {

    var origin = Point() //初始化为（0.0，0.0）
    var size = Size()   //初始化为 （0.0，0.0）
    
    init(){}    //自动获得的默认构造器，获得的都是默认值
    
    init(origin: Point, size: Size) {
    
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
    
        let originX = center.x - size.width/2
        let originY = center.y - size.height/2
        
        // 调用init(origin: Point, size: Size)这个函数来做的
        self.init(origin:Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 5.0, height: 3.0))
let originRect = Rect(origin: Point(x: 2.0, y: 3.0), size: Size(width: 5.0, height: 5.0))

class Vehicle {
    
    var numberOfWheels = 0
    var description: String {
    
        return "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")

class Bicyle: Vehicle {

    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicyle = Bicyle()
print(bicyle.description)


class Food {

    var name: String
    //指定构造器
    init(name: String) {
    
        self.name = name
    }
    //便利构造器
    convenience init() {
    
        self.init(name: "[Unnamed]")
    }
}


let namedMeat = Food(name: "Bacon")
print(namedMeat.name)

let mysteryMeat = Food()
print(namedMeat.name)

class RecipeIngredient: Food {

    var quantity: Int
    
    //当前这个类的指定构造器
    init(name: String, quantity: Int) {
        
        //满足两段式构造过程的安全检查1
        self.quantity = quantity
        super.init(name: name)
    }
    //使用了个跟Food 类中指定构造器init(name: String)相同的参数，因此是重写父类的init(name: String)方法
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient() //这个初始化方法是调用的父类的便利构造器
let oneBacon = RecipeIngredient(name: "Bacon")  //这个是RecipeIngredient的便利构造器方法
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6) //RecipeIngredient的指定构造器方法


class ShoppingList: RecipeIngredient {

    var purchased = false
    
    var description: String {
    
        var output = "\(quantity) X \(name)"
        output += purchased ? " Y " : " N"
        
        return output
    }
}

var breakfastList = [

    ShoppingList(),
    ShoppingList(name: "Bacon"),
    ShoppingList(name: "Eggs", quantity: 6)
]

breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
breakfastList[0].description

for item in breakfastList {

    print(item.description)
}


struct Animal {

    let species :String
    init?(species: String) {
    
        if species.isEmpty {
        
            return nil
        }
        self.species = species
    }
}

let someCreature = Animal(species: "Tager")

if let tager = someCreature {

    print("An animal was initialized with a species of \(tager.species)")
}

let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}

enum TemperatureUnit {

    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
    
        switch symbol {
        case "K":
            self = .Kelvin
            
        case "C":
            self = .Celsius
            
        case "F":
            self = .Fahrenheit
            
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {

    print("This is defined temperature unit, so initialization succeeded")

}

let unknowUnit = TemperatureUnit(symbol :"X")
if unknowUnit == nil {

    print("This is not a defined temperature unit, so initialization failed")
}

enum AnTemperatureUnit: Character {
    case Kelvin = "K", Celsius = "C" , Fahrenheit = "F"
}

let anFahrenheitUnit = AnTemperatureUnit(rawValue: "F")
if anFahrenheitUnit != nil {

    print("This is a defined tempure unit , so initlization succeeded.")
}

let anUnknowUnit = AnTemperatureUnit(rawValue: "X")

if anUnknowUnit == nil {

    print("This is not a defined temperature unit, so initialization failed")
}

class Product {

    let name: String!
    init?(name: String) {
    
        self.name = name
        if name.isEmpty {
            return nil
        }
    }
}

if let blowTie = Product(name: "bow tie") {

    print("The product's name is \(blowTie.name)")
}

class CartItem: Product {

    let quanlity: Int!
    init?(name: String, quanlity: Int) {
        
        self.quanlity = quanlity
        super.init(name: name)
        
        if quanlity < 1 {
            return nil
        }
    }
}

if let twoSocks = CartItem(name: "sock", quanlity: 2) {

    print("Item : \(twoSocks.name), quanlity: \(twoSocks.quanlity)")
}

if let zeroShirts = CartItem(name: "shirt", quanlity: 0) {

    print("Item : \(zeroShirts.name), quanlity: \(zeroShirts.quanlity)")
}else {

    print("Unable to initialize shirts")
}

if let oneUnnamed = CartItem(name: "", quanlity: 1) {

    print("Item: \(oneUnnamed.name), quanlity:\(oneUnnamed.quanlity)")
}else {

    print("Unable to initialize one unnamed product")
}

class Document {

    var name : String?
    
    //该构造器构建了一个name属性值为nil的document对象
    init() {}
    //该构造器构建了一个name属性值为非空字符串的document对象
    init?(name: String) {
    
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {

    override init() {
        
        super.init()
        self.name = "[Untitled]"
    }
    
    //用一个非可失败构造器init(name:)，重写了父类可失败构造器init?(name:)
    override init(name: String) {
        
        super.init()
        
        if name.isEmpty {
            
            self.name = "[Untitled]"
        }else {
        
            self.name = name
        }
    }
}

class UntitledDocument: Document {

    override init() {
        //调用的是父类的可失败的构造器init(name:)
        super.init(name: "[Untitled]")!
    }
}

class MarkFailure {
    
    let status: Int!
    
    init!(status:Int) {
        
        if status == 0 {
            
            return nil
        }
        self.status = status
    }
}

let mark = MarkFailure(status: 0)
let anotherMark = MarkFailure(status: 8)
print(" failure : \(anotherMark.status)")


class SomeClass {
    
    var name: String?
    required init() {
    
        self.name = "default"
    }
    
    init?(name: String) {
    
        if name.isEmpty {
            self.name = "default"
        }else {
            self.name = name
        }
    }
}

class SomeSubClass: SomeClass {

    required init() {
        super.init()
        self.name = "Subdefault"
    }
    
    override init(name: String) {
        super.init(name: name)!
        if name.isEmpty {
            
            self.name = "Subdefault"
            
        }else {
        
            self.name = name
        }
    }
}

let subSome = SomeSubClass.init()
print("subsome :\(subSome.name!)")

let  tesSubSome = SomeSubClass(name: "Sub")
print("sub :\(tesSubSome.name!)")

//class ClouserClass {
//    let someProperty: SomeType = {
//        return someValue
//        
//    }()
//}

struct Checkerboard {
    
    let boardColors:[Bool] = {
    
        var tempoaryBoard = [Bool]()
        var isBlack = false
        
        for i in 1...10 {
        
            for j in 1...10 {
            
                tempoaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        
        return tempoaryBoard
    }()
    
    func squarelBlackAtRow(row: Int, column: Int) -> Bool {
        
        return boardColors[(row * 10) + column]
    }
}

let board = Checkerboard()
print(board.squarelBlackAtRow(0, column: 1))
print(board.squarelBlackAtRow(9, column: 9))

struct Bank {
    static var coinslnBank = 10_000
    
    static func vendCoins( numberOfCoinsToVend: Int) -> Int {
    
       let numberOfCoinsToVend = min(numberOfCoinsToVend, coinslnBank)
        coinslnBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func receiveCoins(coins: Int) {
    
        coinslnBank += coins
    }
}

class Player {
    
    var coinslnPures: Int
    
    init(coins:Int){
            
        coinslnPures = Bank.vendCoins(coins)
    }
        
    func winCoins(coins: Int) {
        
        coinslnPures += Bank.vendCoins(coins)
    }
        
    deinit {
        
        Bank.receiveCoins(coinslnPures)
    }
}


var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinslnPures) coins")
print("There are now \(Bank.coinslnBank) coins left in the bank")

playerOne!.winCoins(2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinslnPures) coins")
print("The bank now only has \(Bank.coinslnBank) coins left")

playerOne = nil
print("PlayerOne has left the game")
print("The bank now has \(Bank.coinslnBank) coins")














