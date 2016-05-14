//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let exclamtionMark :String = str
var welcome = "hello word !"
welcome.appendContentsOf(str)
let count = welcome.characters.count
welcome.rangeOfString("hello")


let multiplier = 3
let message = "\(multiplier) times 2.5 \(Double (multiplier) * 2.5)"
print(message)

let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"
//let regionalIndicatoeForUS: Character = "\u{1F1A} \u{1F1F8}"

let unusualMenagrie = "Koala, Snail, Penguin, Dromedary "
print(unusualMenagrie.characters.count)

var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
word += "\u{301}"

let greeting = "Guten Tag"
greeting[greeting.startIndex]
greeting[greeting.endIndex.predecessor()]
greeting[greeting.startIndex.successor()]


let index = greeting.startIndex.advancedBy(7)
greeting[index]
//拿到对应的下标
greeting.startIndex.successor()
greeting.endIndex.predecessor()


//越界
//greeting[greeting.endIndex]
//greeting.endIndex.successor()

for index in greeting.characters.indices {

    print("\(greeting[index]) ", separator: "")
}

var welcomeStr = "hello"
welcomeStr.insert("！", atIndex: welcomeStr.endIndex)

welcomeStr.insertContentsOf(" there".characters, at: welcomeStr.endIndex.predecessor())

welcomeStr.removeAtIndex(welcomeStr.endIndex.predecessor())
print(welcomeStr)

let range = welcomeStr.endIndex.advancedBy(-6)..<welcomeStr.endIndex
welcomeStr.removeRange(range)

let quotation = "We're a lot alike, you and i"
let sameQuotation = "We're a lot alike, you and I."


if quotation == sameQuotation {

    print("Thess two string are considered equal")
}else if quotation != sameQuotation {

    print("not equal ")
}

//俄语和英语中的字符 A 不是一个意思。如果两个字符串（或者两个字符）的可扩展的字形群集是标准相等的，那么就认为它们是相等的。在这个情况下，即使可扩展的字形集群是有不同的Unicode标量构成的，只要它们有同样的语言意义和外观，就认为它们是标准相等的。
let eAcuteQuestion = "Voulez-vous un caf\u{E9}"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQuestion == combinedEAcuteQuestion {

     print("these equal ")
}

let latinCaptilLetterA: Character = "\u{41}"
let cyrillicCaptilLetterA: Character = "\u{0410}"

if latinCaptilLetterA != cyrillicCaptilLetterA {
    print("These two characters are not equal")
}

let romeAndJuliet = [

    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: Outside Capulet's mansion",
    "Act 2 Scene 1: Capulet's orchard",
    "Act 2 Scene 2: The Greate hall in Capulet's mansion",
    "Act 2 Scene 3: Outside Firar Lawrence's cell",
    "Act 2 Scene 4: Firar Lawrence's cell",
    "Act 2 Scene 5: Capulet's mansion"
]

var act1SenceCount = 0
for scene in romeAndJuliet {

    if scene.hasPrefix("Act 1") {
        act1SenceCount += 1
    }
}

print("There are \(act1SenceCount) scene in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeAndJuliet {

    if scene.hasSuffix("Capulet's mansion") {
    
        mansionCount += 1
    }else if scene.hasSuffix("cell") {
    
        cellCount += 1
    }
}


let dogString = "Dog !!🐶"
for codeUint in dogString.utf8 {

    print("\(codeUint) ", terminator: "")
}
print("")

for codeUint in dogString.utf16 {

    print("\(codeUint) ", terminator: "")
}
print("")

for scalar in dogString.unicodeScalars {

    print("\(scalar) ")
}



