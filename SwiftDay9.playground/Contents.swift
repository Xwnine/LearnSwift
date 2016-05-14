//: Playground - noun: a place where people can play

import UIKit

func swapTwoInts(inout a: Int, inout _ b: Int) {
    
    let tempoaryA = a
        a = b
        b = tempoaryA
}

var someInt = 3
var anotherInt = 7
swapTwoInts(&someInt, &anotherInt)

func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b;
}
func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
mathFunction = multiplyTwoInts


/**
 Function Tyes
 
 - parameter mathFunction: (Int, Int) -> Int
 - parameter a:            Int
 - parameter b:            Int
 */
func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {

    print("Result: \(mathFunction(a, b))")

}

func stepForward(input: Int) -> Int {
    return input + 1
}

func stepBackward(input: Int) -> Int {
    return input - 1
}

/**
 Function Type as Return
 
 - parameter backwards: Bool
 
 - returns: function type: (Int) -> Int
 */
func chooseStepFunction(backwards:Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

/**
 Nested Functions
 
 - parameter backwards: Bool
 
 - returns: function type (Int) -> Int
 */
func chooseNestedStepFunction(backwards: Bool) -> (Int) ->Int {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    func stepBackward(input: Int) ->Int {
        return input - 1
    }
    return backwards ? stepBackward : stepForward
}

var value = -4
let moveNearerToZero = chooseNestedStepFunction(value > 0)

while value != 0 {
    print("\(value) ...")
    value = moveNearerToZero(value)
}

var currentValue = 3
let moveNearertoZero = chooseStepFunction(currentValue > 0)

while currentValue != 0 {

    print("\(currentValue) ...")
    currentValue = moveNearertoZero(currentValue)
}

print("zero !", terminator:"")
printMathResult(addTwoInts, 3, 5)
printMathResult(multiplyTwoInts, 3, 5)
let anotherMathFunction = addTwoInts
print("Result: \(mathFunction(2, 3))", terminator: "")

//Closure

let name = ["Chris", "Alex", "Ewa", "Barry", "Dannil"]
func backwards(s1: String, s2: String) ->Bool {

    return s1 > s2
}
var reversed = name.sort(backwards)

reversed = name.sort({(s1: String, s2: String) ->Bool in return s1 > s2})
reversed = name.sort({s1, s2 in return s1 > s2})
reversed = name.sort({s1 , s2 in s1 > s2})
reversed = name.sort({$0 > $1})
reversed = name.sort(>)
reversed = name.sort() {$0 > $1}
func someFunctionThatTakesAClosure(closure: () -> Void){
    
    print("function body goes here")
}

someFunctionThatTakesAClosure ({
    print("here's how call this function without using trailing clourse")
})

someFunctionThatTakesAClosure() {

    print("trailing closure's body goes hers")
}

let digitNames = [
    0:"Zero", 1:"One", 2:"Two", 3:"Three", 4:"Four", 5:"Five", 6:"Six",
    7:"Seven", 8:"Eight", 9:"Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (number) -> String in
    
    //clourse body start
    var number = number
    var output = ""
    while number > 0 {
        //force-unwrap to guaranteed that subscript will always be valid
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}

/**
 cloures capturing values
 
 - parameter amount: Int
 
 - returns: func type () ->Int
 */
func makeIncrementer(forIncrement amount: Int) -> () ->Int {
    var runningTotal = 0
    
    func incrementer() ->Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

//stepTotal's type is a func type (Int) -> () ->Int

let stepTotal = makeIncrementer(forIncrement: 10)
stepTotal()
stepTotal()
stepTotal()

let stepSeven = makeIncrementer(forIncrement: 7)
stepTotal()

print("total stepes \(stepTotal())", terminator: "")














































print("\(someInt) and anotherInt is \(anotherInt)")
