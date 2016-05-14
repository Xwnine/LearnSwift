//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum CompassPoint {
    case North , South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {

    print("The remeberedDirection is still .West")
    
}

struct Resolution {
    var width = 0.0
    var height = 0.0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let hd = Resolution(width: 1920, height: 1080)

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.frameRate = 25.0
tenEighty.name = "1080i"

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

if tenEighty === alsoTenEighty {

    print("tenEighty and alsoTenEighty refers to the same resolution instance")
}

var someArray: Array = [1, 2, 4]
var  dict : Dictionary = ["key":123]


























