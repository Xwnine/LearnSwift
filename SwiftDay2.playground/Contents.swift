//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

typealias AudioSample = UInt16

var maxAudioFound = AudioSample.max

let b = 10
var a = 5
a = b

let (x, y) = (1, 2)

print(x)
if x == y {
    print(10.0/2.5)
}


print(10/2.5)
//对浮点数求余
print(10%2.5)

let string :String = "hello" + "," + "world"
let number = 4 * (-2) + -1
var i = 0;

i += 1
i -= 1

var num = 0

//let b = ++num
//let c = num ++

num += 3;
print(num)

let name = "world"
if name == "world" {
    print("hello \(name)")
}

let contentHeight = 40
let hasHeader = true
let rowHeigt = contentHeight + (hasHeader ? 50 : 20)

let defaultColorName = "Red"
var userDefinedColorName :String?
print(userDefinedColorName)

//先隐式解析
var colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)

//强制拆包，给标量赋值
userDefinedColorName = "Green"
colorNameToUse = userDefinedColorName ?? defaultColorName
print(userDefinedColorName)
print(colorNameToUse)

for index in 0...12 {

    print("\(index) * 5 = \(index * 5)")
}

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count;
for i in 0 ..< names.count {

    print("第 \(i + 1) 个人叫 \(names[i])")
}

let allowedEntry = false

if !allowedEntry {
    print("ACCESS DENIED")
}

let enterDoorCode = true
let passedRetainScan = false

if enterDoorCode && passedRetainScan {

    print("welcome")
}else {

    print("ACCESS DENIED")
}

let hasDoorKey = false
let konwsOverridspassword = true

if hasDoorKey || konwsOverridspassword {

    print("welcome")
}else {

    print("ACCESS DENIED")
}

if enterDoorCode && passedRetainScan || hasDoorKey || konwsOverridspassword {

    print("welcome ！")
}else {

    print("ACCESS DENIED")
}

if (enterDoorCode && passedRetainScan) || hasDoorKey || konwsOverridspassword {

    print("WELCOME !")
}else {

    print( " ACCESS DENIED")
}
























