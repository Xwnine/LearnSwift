//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func greet(person:[String:String]) {
    
//判断可选绑定值是否有值，如果没有值就去执行else {}后面的操作
    guard let name = person["name"] else {
    
        return
    }
    
    print("Hello \(name)")
    guard let location = person["location"] else {
    
        print("i hope the weather is nice near you .")
        return
    }
    print("I hope the weather is nice in \(location).")

}
//greet(["name": "John"])
greet(["name":"Jane", "location":"Cupertion"])


if #available(iOS 9, OSX 10.10,*) {

    print("the latest version")
}else {

    print("please update you os version")
}

func sayHello(personName:String) -> String {

    let greeting = "Hello," + personName + "!"
    return greeting
}

func sayHelloAgain(personName:String) ->String {

    let greeting = "Hello Again," + personName + "!"
    return greeting
    
}

func sayHelloWorld() ->String {

    return "Hello , world"
}

func sayGoodbye(personName:String) {
    print("Goodbye, \(personName)")
}

func sayHello(personName:String, alreadyGreeted:Bool) -> String {
    if alreadyGreeted {
        return sayHelloAgain(personName)
    }else {
    
        return sayHello(personName)
    }
}

func printAndCount(stringToPrint:String) -> Int {
    print(stringToPrint)
    
    return stringToPrint.characters.count
}

func printWithoutCount(stringToPrint:String) {
    
    printAndCount(stringToPrint)
}

//传入一个[Int]型的数组，返回一个元祖
func minMax(array:[Int]) -> (min:Int, max:Int) {
    
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array {
        if value < currentMin {
            currentMin = value
        }else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

//判断数组为空的情形
func minMaxSafe(array:[Int]) -> (min:Int, max:Int)? {
    
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array {
        if value < currentMin {
            currentMin = value
        }else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

func someFunction(firstParameterName:Int, secondParameterName:Int) {
    print(firstParameterName)
    print(secondParameterName)
}

//指定函数的外部参数名字
func someFunction(externalParameterName localParamterName: Int) {
    print(localParamterName)
}

func sayHellpo(to person:String, and anotherPerson:String) -> String {
    return "Hello \(person) and \(anotherPerson)!"
}


func someFunction(firstParameter:Int, _secondParameterName:Int) {

    print(firstParameter)
    print(_secondParameterName)
    print(firstParameter + _secondParameterName)
}
//下划线+空格，忽略第二个参数名称
func someFunction(firstParameter:Int, _ secondParameterName:Int) {
    
    print(firstParameter)
    print(secondParameterName)
    print(firstParameter + secondParameterName)
}

func someFunction(parameterWithDefault:Int = 12) {
    
    print(parameterWithDefault)
    
}

//函数的可变参数
func arithmeticMean(numbers:Double...) -> Double {
    var total:Double = 0
    for number in numbers {
    
        total += number
    }
    return total/Double(numbers.count)
}


print(sayHello("Zubo Wu"))
print(sayHello("CJJ"), terminator:"")
print(sayHelloWorld(), terminator:"")
print(sayHello("Time", alreadyGreeted: false), terminator:"")
let bounds = minMax([8, 9, -12, 109, 90, 2, 71, -2])
print("min is \(bounds.min), max is \(bounds.max)", terminator: "")
someFunction(1, secondParameterName: 2)
someFunction(externalParameterName: 3)
print(sayHellpo(to: "Bill", and: "Ted"), terminator:"")

someFunction(1, 2)
//someFunction(1, _secondParameterName: 2)

someFunction()
someFunction(6)


