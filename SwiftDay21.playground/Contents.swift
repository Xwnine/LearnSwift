//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
func swapTwoValues<T>(inout a:T, inout _ b: T) {

    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)

var someString = "hello"
var anotherString = "world"

swapTwoValues(&someString, &anotherString)

struct IntStack {
    var items = [Int]()
    mutating func push(item: Int) {
    
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct Stack<T> {
    var items = [T]()
    
    mutating func push(item: T) {
    
        items.append(item)
    }
    
    mutating func pop() ->T {
    
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("doe")
stackOfStrings.push("trs")
stackOfStrings.push("cuatro")

print(stackOfStrings.items.count)

let fromTheTop = stackOfStrings.pop()

//给extension拓展一个计算属性，获取栈顶元素
extension Stack {

    var topItem: T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

let temTop = stackOfStrings.topItem

if let topItem = stackOfStrings.topItem {

    print("The top item on the stack is \(topItem).")
}

func findStringIndex(array: [String], _ valueToFind: String) -> Int? {
    
    for (index, value) in array.enumerate() {
    
        if  value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llmam", "packeet", "terrapin"]

if let foundIndex = findStringIndex(strings, "llmam") {

    print(" The index of llmamis \(foundIndex)")
}


//错误写法：
//func findIndex<T>(array: [T], _ valueToFind: T) -> Int? {
//
//    for (index, value) in array.enumerate() {
//    
//        if value == valueToFind {
//        
//            return index
//        }
//    }
//    
//    return nil
//    
//}

func findIndex<T: Equatable>(array: [T], _ valueIndex: T) -> Int? {
    
    for (index, value) in array.enumerate() {
        
        if value == valueIndex {
        
            return index
        }
    }
    
    return nil
}

let doubleIndex = findIndex([3.12212, 0.9, 2.098], 0.7)
let stringIndex = findIndex(["Mike", "Jobs", "Maclum", "Kwail", "Pual"], "Pual")

protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int {get}
    subscript(i: Int) ->ItemType {get}
}

struct StackContainer: Container {
    
    var items = [Int]()
    mutating func push(item: Int) {
    
        items.append(item)
    }
    
    mutating func pop() -> Int {
        
        return items.removeLast()
    }
    
    //遵守协议的实现
    
    typealias ItemType = Int
    
    mutating func append(item: ItemType) {
        self.push(item)
    }
    
    var count: Int {
    
        return items.count
    }
    subscript(i: Int) -> Int {
    
        return items[i]
    }
}

struct GenericStack<Element>: Container {
    
    var items = [Element]()
    mutating func push(item: Element) {
    
        items.append(item)
    }
    
    mutating func pop() -> Element {
    
        return items.removeLast()
    }
    
    mutating func append(item: Element) {
        self.push(item)
    }
    
    var count: Int {
    
        return items.count
    }
    
    subscript(i: Int) -> Element {
    
        return items[i]
    }
}

//扩展array遵循Container协议
extension Array: Container{}

func allItemsMatch<C1: Container, C2: Container where C1.ItemType == C2.ItemType, C1.ItemType: Equatable> (someContainer: C1, _ anotherContainer: C2) -> Bool {
    
    
    if someContainer.count != anotherContainer.count {
    
        return false
    }
    
    for i in 0..<someContainer.count {
        
        if  someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    return true
}

var stackOfStr = GenericStack<String>()

stackOfStr.push("uou")
stackOfStr.push("dos")
stackOfStr.push("res")
stackOfStr.push("and'")

var arrayOfStrings = ["uou", "dos", "res", "and'"]

if allItemsMatch(stackOfStr,  arrayOfStrings) {

    print(" all match")
} else {

    print("Not all items match")
}


public class SomePubicClass{}
internal class SomeInternalClass {}
private class SomePrivateClass {}

public var somePubliVariable = 0
internal let someInteralConstant = 0
private func somePrivateFunction() {}

public class SomePubClass {

    public var somePublicProperty = 0 //显式的public类成员
    var someInternalProperty = 0 //隐式internal的类成员
    private func pubClassPrivateMethod() {} //显式的private方法
    
}

//隐士的Internal类
class SomeInterClass {

    var someInternalProperty = 0 //隐式的成员
    private func internalClassPrivateMethod() {} //显示的private方法
}

//显式的private类
private  class somePrivateClass{
    
    var somePrivateProperty = 0 // 隐式的类成员
    func privateClassPrivateMethod() {} //
    
}


public enum CompassPoint {

    case North
    case South
    case East
    case West
}

public class A {

    private func someMethod () {}
}

internal class B : A {

    override internal func someMethod() {
        
        super.someMethod()
        print( " super class public")
    }
}

struct TrackedString {
    
    private(set) var numberOfEdits = 0
    var value: String = "" {
    
        didSet {
        
            numberOfEdits += 1
        }
    }
}

var stringToEdit  = TrackedString()

//下面这行代码是有效的，因为stringToEdit实例跟TrackedString的定义是在同一个源文件中
stringToEdit.numberOfEdits = 10
stringToEdit.value = "Test private var"
print(stringToEdit.value)
print(stringToEdit.numberOfEdits)


public struct TrackString {

    //公开numberOfEdit 属性的getter
    public private(set) var numberOfEdit = 0
    public var value: String = "" {
    
        didSet {
        
            numberOfEdit += 1
        }
    }
    public init(){}
    
}




































