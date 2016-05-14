//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]

let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sort()

oddDigits.intersect(evenDigits).sort()

oddDigits.subtract(singleDigitPrimeNumbers).sort()

oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()

let houseAnimals: Set = ["🐱", "🐶 "]
let farmAnimals: Set = ["🐑", "🐂", "🐴", "🐷"]
let cityAnimals: Set = ["🐶", "🐔"]
farmAnimals.isSubsetOf(farmAnimals)

farmAnimals.isSubsetOf(houseAnimals)

farmAnimals.isDisjointWith(cityAnimals)

var nameOfIntegers = [Int: String]()
nameOfIntegers = [:]
nameOfIntegers[16] = "sixteen"

var airports:[String: String] = ["YYZ": "Baiyun", "DUB": "Dubin"]
if airports.isEmpty  {

    print("The airports dictionary is not empty")
}else {

    print("The airports dictionary is not empty")
}

airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Doubin Airport", forKey: "DUB"){

    print("The old value for DUB was \(oldValue)")
}

if let airportName = airports["DUB"] {

    print("The name of the airport is \(airportName)")
}else {

    print("That airport is not in the airports dictionary")
}

airports["APL"] = "Apple Internation"
airports["APL"] = nil

if let removeValue = airports.removeValueForKey("APL"){
    print("The removed airport's name is \(removeValue)")
}

for airportCode in airports.keys {

    print("airport code: \(airportCode)")
}

for airportName in airports.values {

    print("Airport name :\(airportName)")
}

let airportCodes = Array(airports.keys)
let airportName = Array(airports.values)

airports = [:]

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4];
for (animalName, legCount) in numberOfLegs {
    
    print("\(animalName)s have \(legCount) legs")
}


for index in 1...5 {

    print("\(index) times 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {

    print("Hello, \(name)!")
}

let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)
board[03] = +08; board[06] = +11; board[09] = +09;
board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02;
board[24] = -08


var square = 0
var diceRoll = 0

while square < finalSquare {

    diceRoll += 1
    
    if diceRoll == 7 {
    
        diceRoll = 1
    }
    square += diceRoll
    if square < board.count {
    
        square += board[square]
    }
}
print("game over !")

square = 0
diceRoll = 0

repeat {
    
    square += board[square]
    diceRoll += 1
    if diceRoll == 7 {
    
        square += diceRoll
    }

}while square < finalSquare
print("Game over !")


var temperature = 30
if temperature <= 32 {

print("is code ")
}

let someCharacter: Character = "e"
switch someCharacter {

    case "a", "e", "i", "o", "u":
    
    print("\(someCharacter) is a vowel")
    
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q","r", "s", "t", "v", "x", "w", "y", "z":
    print("\(someCharacter) is a consonant")
    
default:
    print("\(someCharacter) is not a vowel or a consonant")
}







































