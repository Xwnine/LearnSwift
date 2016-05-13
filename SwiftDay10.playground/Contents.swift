//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class MediaItem {

    var name: String
    init(name: String){
    
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist:String
    
    init(name: String, artist:String) {
        self.artist = artist
        super.init(name: name)
        
    }
    
}

let library = [

    Movie(name: "Casablanca", director: "Niche"),
    Song(name: "Blue Sude", artist: "Elvis"),
    Song(name: "Cituzen Kane", artist: "Orson"),
    Movie(name: "Arevenge", director: "Ronsu"),
    Song(name: "Beacause", artist: "Sherly")
]

var movieCount = 0
var songCount = 0

for item in library {

    if item is Movie {
    
        movieCount += 1
    }else if item is Song {
    
        songCount += 1
    }
}

print(movieCount)
print(songCount)

for item in library {

    //if表达式的条件其实是做了两件事，首先试图将item向下赚为Movie，使用可选绑定来判断是否下转成功
    if let movie = item as? Movie {
    
        print("Movie: '\(movie.name)', dir.\(movie.director)")
    }else if let song = item as? Song {
    
        print("Song: '\(song.name)', by \(song.artist)")
    }
}

let someObjects: [AnyObject] = [

    Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones"),
    Movie(name: "Slien", director: "Desde Cioou")
]

for object in someObjects {
    let movie = object as! Movie
    print(movie.name, movie.director)
    
}

for movie in someObjects as! [Movie] {

    print(movie.director, movie.name)
}

var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.1415926)
things.append("hello")
things.append((3.0, 5.0))
things.append(["key":8.0, 9:"A"])
things.append(Movie(name: "Ghost", director: "Ivan"))
things.append({(name: String) -> String in "Hello, \(name)"})

for thing in things {

    switch thing {
    
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as an Double")
    case let someInt as Int:
        print("an Integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some double value that I don't want to prite")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x,y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called '\(movie.name)', dir. \(movie.director)")
    case let stringConverter as String -> String:
        print(stringConverter("Andrew"))
    default:
        print("someThing else")

    }
}

struct BlackkjackCard {
    //嵌套定义枚举类型Suit
    
    enum Suit: Character {
        case Spades = "♠️", Hearts = "❤️", Diamonds = "♦️", Clubs = "♣️"
    }
    
    //嵌套定义枚举型Rank
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        
        struct Values {
            let first:Int, Second: Int?
        }
        
        var values: Values {
        
            switch self {
            case .Ace:
                return Values(first: 1, Second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, Second: nil)
            default:
                return Values(first: self.rawValue, Second: nil)
            }
        }
    }
    
    //BlackjackCard 的属性和方法
    let rank: Rank, suit: Suit
    var descriotion: String {
    
        var output = "suit is \(suit.rawValue)"
        output += "value is \(rank.values.first)"
        
        if let second = rank.values.Second {
            output += "or \(second)"
        }
        
        return output
    }
}

let theAceOfSpades = BlackkjackCard(rank: .Ace, suit: .Spades)
print(theAceOfSpades.descriotion)
let heartSymbol = BlackkjackCard.Suit.Hearts.rawValue

//Double拓展，添加一些计算属性
extension Double {

    var km: Double { return self * 1_000.0}
    var m: Double { return self}
    var cm: Double { return self / 100.0}
    var mm: Double { return self / 1_000.0}
    var ft: Double { return self / 3.28084}
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

let threeFeet = 3.ft
print("There feet is \(threeFeet) meters")

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))


//拓展新的构造器
extension Rect {
    init(center: Point, size: Size) {
    
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let conterRect = Rect(center: Point(x: 4.0, y: 5.0), size: Size(width: 3.0, height: 3.0))

extension Int {

    func repetitions(task: () ->()) {
        
        for  _ in 0..<self {
            task()
        }
    }
}

3.repetitions({
    
    print("Hello")
})

4.repetitions{

    print("Coodbye!")
}

extension Int {

    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()

extension Int {

    subscript(digitIndex: Int) -> Int {
    
        var decimalBase = 1
        
        for _ in 0..<digitIndex {
              decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

746381295[0]
746381295[9]
746381295[1]
746381295[2]
746381295[8]

extension Int {

    enum Kind {
        case Negative, Zero, Positive
    }
    
    var kind: Kind {
    
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}

func printIntegerKinds(numbers: [Int]) {
    
    for number in numbers {
        
        switch number.kind {
        case .Negative:
            
            print("_", terminator: "")
            
        case .Positive:
            print("+", terminator: "")
            
        case .Zero:
            print("0", terminator: "")
        }
    }
    print("")
}

printIntegerKinds([2, 13, -27, 0, -6, 0, 8, 10])

protocol FullyNamed {
    
    var fullName: String {get}
}

struct Person: FullyNamed {
    var fullName: String
}

let andrew = Person(fullName: "Andrew Appleseed")


class Starship: FullyNamed {
    var prefix:String?
    var name:String
    
    init(name: String, prefix:String? = nil) {
    
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
    
        return (prefix != nil ? prefix! + "" : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName


protocol RandomNumberGenerator {
    
    func random() -> Double
}


class LinearCongruentialGenerator: RandomNumberGenerator {

    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
  
    func random() -> Double {
        
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print(generator.random())
print(generator.random())

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case Off, On
    
    mutating func toggle() {
  
        switch self {
   
        case Off:
            self = On
        case On:
            self = Off
        }
    }
}

var lightSwitch = OnOffSwitch.Off

lightSwitch.toggle()
















