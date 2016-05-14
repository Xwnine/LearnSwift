//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//类型推断，你好为string类型
var 你好 = str
你好 = "你好 项小燕"

var sexy = "famel"
sexy = "女"


let 燕子的性别 = sexy

let 仙子 = 0, 男神 = 1, 女神 = 2

var x = 0.0, y = 0.1, z = 0.3

let add = x + y

//生命一个类型为string的变量，变量名为 welcomeMessage
var welcomeMessage :String

//类型推断，hello为string
let hello = "hello swift"

welcomeMessage = hello
welcomeMessage = "Bonjour"

var red , blue , green :Double
red = 255.0
blue = 254.0
green = 233.0


let  wee = "dogcow"
//下面这种做法是违背常量的定义的
//wee = "swift"

print(wee)

print("this is my first swift deomo")

//向一个字符串中插入一个常量、变量

var mutableStr = "This is my first string"
print(mutableStr)

print("my first swift Demo with \(hello)")

mutableStr = "test \(hello)"

print(mutableStr,hello)

mutableStr = "test \("tesr \("test inssert")") \(hello) \("wolrd")"

/// swift 中不强求使用;，有一种情况必须要使用分号，就是在同一行内写多条独立的语句
let cat = "ooxx"; print(cat)

let minValue = UInt8.min
let maxValue = UInt8.max
let min16 = UInt16.min
let max16 = UInt16.max
let min32 = UInt32.min
let max32 = UInt32.max
let min64 = UInt64.min
let max64 = UInt64.max
let maxInt = Int64.max
let minInt = Int64.min
let minInt8 = Int8.min
let maxInt8 = Int8.max

//64位平台上，Int和Int64长度相同
let intMax = Int.max

//swift推荐，尽量不要使用UInt，除非真的需要存储一个跟当前平台原生UInt长度一样的数据
//64位平台上，UInt和UInt64长度相同
let uIntMax = UInt.max

let meaningOfLine = 42

let 浮点数 = 2.0
//Float小数点末尾最多有8位数，最少是6位数
let double = 3.12416909
//Double小数点后至少有15位数
let dou = double + 浮点数

let an = 3 + 0.006789

var av:Float = 0.090


let f:Float = 1.90

let d:Double = 10.000

let sum = d + Double(f)

let res = f + Float(d)

//存储值超过了Int8的最大值
//let tooBig:Int8 = Int8.max + 1

let one:UInt8 = 2
let t:UInt16 = 2000
let ret = t + UInt16(one)
print(ret)








































