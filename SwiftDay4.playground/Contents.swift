//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var someString = ""
var anotherString = String();

if someString.isEmpty {

    print("Nothing to see here")
}

var mutString = "Horse"
mutString += "and carriage"
print(mutString)

let contentString = "Highander"
//contentString += "and another value"

for char in "Dog!🐶".characters {
    print(char)
}

let exclamationMark:Character = "!"
let catCharacters:[Character] = ["C", "a", "t", exclamationMark, "🐱"];

let catString = String(catCharacters)
print(catString)

let string1 = "hello"
let string2 = "world"

var welcome = string1 + string2 + catString
welcome += str
welcome += "!"
welcome.append(exclamationMark)
welcome.rangeOfString(catString)

let range = welcome.endIndex.predecessor().advancedBy(-6)..<welcome.endIndex
welcome.removeRange(range)

let index = welcome.endIndex.predecessor().advancedBy(-8)
welcome.removeAtIndex(index)
print(welcome)

//创建一个空的数组
var someInts = [Int]();
print("SomeInts is of type[Int] with \(someInts.count) items")

someInts.append(3)
let count = someInts.count
//清空数组，但是someInts数组仍然是[Int]类型的
someInts = []
//创建一个带有默认值的数组
var threeDouble = [Double](count: 3, repeatedValue: 0.0)
var anotherThreesDouble = Array(count: 3,repeatedValue: 2.5)

var sixDouble = threeDouble + anotherThreesDouble
sixDouble = anotherThreesDouble + threeDouble
sixDouble.append(5)

let numberString = "123.09"
sixDouble.append((numberString as NSString).doubleValue)

sixDouble.append(Double(numberString)!)


//let numFromString: Double = Double(numberString)!
//let numFromString = Double(numberString)!
let numFromString = Double(numberString)


sixDouble.append(numFromString!)

var shoppingList = ["Eggs", "Milk"]
shoppingList.append(str)

var list = ["eggs", "milk"];
list.append(str)
if list.isEmpty {

    print("list contain something")
}else {

    print("list is empty")
}
shoppingList += ["Baking Powder"]
var firstItme = shoppingList[0]
shoppingList[0] = "Six eggs"

shoppingList += ["Four", "Three","two"]
shoppingList[4...6] = ["Bannas", "Apples"]
let shopCount = shoppingList.count

shoppingList.insert("Maple Syrup", atIndex: 0)

let mapleSyrup = shoppingList.removeAtIndex(0)
print(mapleSyrup)

firstItme = shoppingList[0]
let apples = shoppingList.removeLast()
print(apples)
print("shopList count is \(shoppingList.count)")

for item in shoppingList {

    print(item)
}

//枚举器来遍历数组.返回一个元祖
for (index, value) in shoppingList.enumerate() {

    print("item \(String(index + 1)): \(value)")
    print(index, value)
}

//集合
var letters = Set<Character>()
let lenght = letters.count
letters.insert("a")
print(letters.count)

letters = []
print(letters.count)

letters = ["a"]
letters.removeAll()

//当set中的元素类型都是一样的时候，即使用数组字面量来初始化一个set.swift是可以推断出来favoriteGenres的正确类型为 Set<String>
var favoriteGenres: Set<String> = ["Rock", "Classical", "Soul", "Hip hop"]
//var favoriteGenres: Set = ["Rock", "Classical", "Soul", "Hip hop"] 与上面的是等价的

let setCount = favoriteGenres.count

if favoriteGenres.isEmpty {

    print("set has nothing")
}else {

    print(favoriteGenres.first)
}

favoriteGenres.insert("Jazz'")

if let removedGame = favoriteGenres.remove("Rock") {

    print(removedGame)
} else if favoriteGenres.contains("Funk") {

    print(" funky")
}else {

    print("I am not funky")
}

for gene in favoriteGenres {

    print("\(gene)")
}
//按照特定顺序来遍历一个Set
for gener in favoriteGenres.sort() {

    print("\(gener)")
}



























