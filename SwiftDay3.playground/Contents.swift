//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
typealias StringTest = String;

var test :StringTest
test = "hello"
print(test)

test = "\(test) word"

typealias TypeUInt16 = UInt16
var uInt16Min = TypeUInt16.min
var uIntMax = TypeUInt16.max

typealias TypeUInt32 = UInt32
let uInt32Min = TypeUInt32.min
let uInt32Max = TypeUInt32.max
let logicTrue = true
let logicFalse = false

print(logicTrue)
print(logicFalse)


var yes = true
var no = false

let testYes :Bool = true
let testNo :Bool = no
var  testYesV :Bool
testYesV = yes

print(testYesV)

if testYesV {

    print(testYesV)
}else {

    print(testYesV = no)
}

let i = 1

//if i {
//
//    
//}
//
var j = 2 
//
//if j {
//
//}

if i==1 && j==2 {

    print(j,i)
}


let http404Error = (404, "Not Found")
let httpStatus = (StringTest :"Not found" , TypeUInt32 :404, Bool :no)

let (statusCode, statusMessage) = http404Error

print("http status code is \(statusCode)")
print("The status message is \(statusMessage)")

//元祖分解
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

//定义一个元祖
let http200Status = (statusCode: 200, description: "Ok")

//访问元祖的元素
let  httpCode = http200Status.statusCode
let message = http200Status.description

print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")


var reqStatus = (Int :200, StringTest:"OK")

reqStatus.Int = 300
reqStatus.0 = 404

reqStatus.StringTest = "Wait..."
reqStatus.1 = "Not Found"

print(reqStatus.Int, reqStatus.1)


//optional 可选值
let possibleNumber:String = "1234"
let convertNubmber = Int(possibleNumber)
let stringToNumber = possibleNumber



//swift中的nil不能用于非可选的常量和变量。swift中的nil和OC中的nil不一样。在OC中，nil是指向不存在的指针。swift中，nil不是指针，他是一个确定的值，用来表示值的缺失。任何类型的可选状态都可以被设置为nil，不只是对象类型。
var serverCode:Int? = 404
serverCode = nil

var serverStatus:Int?
serverStatus = 200

//if语句用来强制解析. 当确定一个可选类型包含值之后，可以在可选的名字后面加一个感叹号来获取值。这个感叹号表示“”我知道这个可选有值，请使用它。

if convertNubmber != nil {
    print("convertNumber contains some integer value.")
}

if convertNubmber == 1234 {
    print( " i know convertNumber contains some integer value ")
}


var perhapsInt: Int?
var perhapsStr: String?
var perhapsString: String? = nil

if perhapsInt != nil {

    print(perhapsInt)
}else {

    print("perhapsInt has nil value")
}


perhapsStr = "hello swift"

if perhapsStr != nil    {

    print("perhapsStr is \(perhapsStr)")
    
}else {

    print("perhapsStr has nil value")
}

//可选绑定
var numberString:String?
numberString = "123456"

if let myString = numberString {

    print("my string has - \(numberString)")
}else {

    print("my string does not have a value")
}

//可选类型使用原则：如果一个常量、变量或函数能够接受nil空值，那就需要给这个类型设为可选类型（正常类型+?），允许接受nil控制则是正常类型。？和！都表示可选类型，区别在于，在可选链中，如果某个环节没有值，？修饰的会返回为nil，不会出现异常。！修饰的会出现异常

if let myString = numberString, anotherString = numberString {

    print(myString, anotherString)
}

//先隐式解析是否有值，然后在转换为Int，最后可选绑定给numString，实现拆包
if let numString:Int = Int(numberString!){
    print(numString)
}

//隐式解析
let possibleStr: String? = "An optional string."
let forcedString = possibleStr!

let assumeString: String! = "An implicitly optional string"
let implicitstring:String = assumeString


if assumeString != nil {

    print(assumeString)
}

if possibleStr != nil {

    print(possibleStr)
}

if let test:String = possibleStr! {
    print(test)
}

if let testString:String = assumeString! {
    print(testString)
}

if let testString = assumeString {
    print(testString)
}


//func canThrowAnError()  throws{
//    
//    assertionFailure("failure")
//}
//
//do {
//
//    try canThrowAnError()
//    NSLog("no failure")
//} catch {
//
//    print("catch failure")
//}

let age = -3
assert(age >= 0, "a person 's age cannot be less than zero")






        