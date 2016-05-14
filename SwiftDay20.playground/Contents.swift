//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol SomeProtool {
    init()
}

//class SomeClass: SomeProtool{
//
//    required init() {
//    
//    }
//}
//
//class SomeSubClass: SomeClass, SomeProtool {
//
//    required override init() {
//        
//    }
//}


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

class Dice {

    let sides:Int
    //定义一个RandomNumberGenerator类型的常量存储属性，因此，任何遵循了RandomNumberGenerator协议的类型的实例都可以赋值给generator
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
    
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {

    print("Random dice roll is \(d6.roll())")
}

protocol DiceGame {
    //定义了一个Dice类型的可读属性
    var dice: Dice {get}
    //定义了一个实例方法
    func play()
}

//和DiceGame协议做成一个委托代理模式，将DiceGame的一些game跟踪功能交给DiceGameDelegate，封装一些方法
protocol DiceGameDelegate {
    
    func gameDidStart(game: DiceGame)
    func game(game: DiceGame, didStartNewTurnWithDiceRolldiceRoll:Int)
    func gameDidEnd(game: DiceGame)
}

class SnakesAndLadders: DiceGame {

    let finalSquare = 25
    //DiceGame中要求的可读属性，这里定义为常量属性
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    
    var square = 0
    var board:[Int]
    
    init() {
    
        board = [Int](count: finalSquare + 1, repeatedValue: 0)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    //可选DiceGameDelegate协议
    var delegate: DiceGameDelegate?
    
    //实现了DiceGame的协议方法
    func play() {
        square = 0
        //可选链中实现DiceGameDelegate协议中的委托方法
        delegate?.gameDidStart(self)
        //添加循环标标签
        gameLoop: while square != finalSquare {
        
            let diceRoll = dice.roll()
            
            delegate?.game(self, didStartNewTurnWithDiceRolldiceRoll: diceRoll)

            switch square + diceRoll {
                case finalSquare:
                    //结束gameLoop循环
                    break gameLoop
                case let newSquare where newSquare > finalSquare:
                    //结束当前循环，立即开始下一次循环
                    continue gameLoop
                default:
                    square += diceRoll
                    square += board[square]
            }
        }
        
        delegate?.gameDidEnd(self)
    }
}


class DiceGameTracker: DiceGameDelegate {

    var numberOfTurns = 0
    func gameDidStart(game: DiceGame) {
         numberOfTurns = 0
        if  game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    
    func game(game: DiceGame, didStartNewTurnWithDiceRolldiceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(didStartNewTurnWithDiceRolldiceRoll)")
    }
    
    func gameDidEnd(game: DiceGame) {
        print("The game latesd for \(numberOfTurns) turns")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()

game.delegate = tracker
game.play()


protocol TextRepresentable {
    var textualDescription: String {
        get
    }
}

//给dice拓展协议

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

let d13 = Dice(sides: 13, generator: LinearCongruentialGenerator())
print(d13.textualDescription)

extension SnakesAndLadders: TextRepresentable {

    var textualDescription: String {
        
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
    
    func printText() {
    
        print(game.textualDescription)
    }
}

game.printText()

struct Hamster {
    var name: String
    
    var textualDescription: String {
    
        return "A hamster named \(name)"
    }
}
//显示声明之后，满足了协议的所有需求的类型才会做出对应的改变
extension Hamster: TextRepresentable{}

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)


//things数组中存放的是遵循了TextRepresentable协议的实例

let things: [TextRepresentable] = [game, d13, simonTheHamster]

for thing in things {

    print(thing.textualDescription)
}











