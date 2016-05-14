//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let approximateCount = 62
let countedThings = "moon orbiting Saturn"

var naturalCount: String

switch approximateCount {

case 0:
    naturalCount = "no"
    
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozen of"
case 100..<1000:
    naturalCount = "hundren of"
default:
    naturalCount = "many"
    
}
print("There are \(naturalCount) \(countedThings).")

let somePoint = (1, 1)
switch somePoint {

case (0, 0):
    print("(0,0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case(0, _):
    print("\(0, somePoint.1) is on the y-axis")
case(-2...2, -2...2):
    print("(\(somePoint.0),\(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside the box")
    
}

let anotherPoint = (2, 0)
switch anotherPoint {

case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let(x, y):
    print("somewnere else at (\(x), \(y))")
    
}


let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {

case let (x, y) where x == y:
    print("\(x), \(y) is on the line x==y")
    
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x==-y")

case let (x, y):
    
    print("\(x), \(y)) is just some arbitrary point")
    
}


let puzzleInput = "great minds think alike"
var puzzleOutput = ""

for character in puzzleInput.characters {

    switch character {
    case "a", "e", "i", "u", "o":
        continue
    default:
        puzzleOutput.append(character)
        
    }
}

print(puzzleOutput)
let numberSymbol: Character = "三"
var possibleIntegerValue: Int?
switch numberSymbol {

case "1", "碧", "二", "三":
    possibleIntegerValue = 1
    
case "3", "留", "三", "四":
    possibleIntegerValue = 2
    
case "4", "哈", "个", "留":
    possibleIntegerValue = 3
    
case "5", "胡", "四", "毛":
    possibleIntegerValue = 4
    
default:
    break

}

if let integerValue = possibleIntegerValue {

    print("the integer value of \(numberSymbol) is \(integerValue).")
}else {

    print("An integer value could not be found for \(numberSymbol).")
}

let integerToDescribe = 5
var desciption = "The number \(integerToDescribe) is "
switch integerToDescribe {
case 2, 3, 4, 5, 7, 11, 13, 17, 19:
    desciption += "a prime number, and also"
    fallthrough
default:
    desciption += "an integer"
}
print(desciption)


let fianleSuqare = 25
var square = 0
var diceRoll = 0


gameLoop : while square !=  fianleSuqare {

 
    diceRoll += 1
    if diceRoll == 7 {
    
        diceRoll = 1
    }
    switch square + diceRoll {
    
    case fianleSuqare:
        
        break gameLoop
    case let newSquare where newSquare > fianleSuqare:
        continue gameLoop
    default:
        square += diceRoll
        
    }
    
}








