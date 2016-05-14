//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
class DataImpoter {
    var fileName = "data.txt"
}

class DataManager {

    lazy var importer = DataImpoter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("smoe data")
manager.data.append("smoe more data")
//现在才创建一个impoter实例
print(manager.importer.fileName, terminator: "")

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    
    var origin = Point()
    var size = Size()
//    计算属性,用来计算矩形的中心点
    var center: Point {
//    getter
        get {
            
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            
            return Point(x: centerX, y: centerY)
        }
        
//       setter
        
        set(newCenter) {
            
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    
    }
    
}

var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
//getter方法
let initialSquareCenter = square.center
//setter方法
square.center = Point(x: 15.0, y: 15.0)
print("new origin is now at (\(square.origin.x), \(square.origin.y))")

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center:Point {
    
        get {
        
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set {
        
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
        
    }
}
//只有getter属性
struct Cuboid {
    var width = 0.0
    var height = 0.0
    var depth = 0.0
//    get方法，省略了get关键字
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4, height: 5, depth: 2)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

class StepCounter {
    
    var totalSteps: Int = 0 {
//    newTotalSteps可以省略，用newValue代替
        willSet (newTotalSteps){
    
            print("About to set totalSteps to \(newTotalSteps)")
        }

        didSet {
    
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }else {
                print("stop")
            }
            
        }
    }
    
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896
stepCounter.totalSteps = 896

struct SomeStructure {
    
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
    
        return 1
    }

}

enum SomeEnumeration {
    
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
    
        return 6
    }
    
}

class SomeClass {
    
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
    
        return 27
    }
    
    class var overrideableComputedTypeProperty: Int {
        
        return 207
    }
    
}

print(SomeStructure.storedTypeProperty)
print(SomeStructure.computedTypeProperty)


print(SomeEnumeration.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)

print(SomeClass.computedTypeProperty)
print(SomeClass.overrideableComputedTypeProperty)
print(SomeClass.storedTypeProperty)


struct AudioChannel {
    //存储型类型属性
    static let thresholdLevel = 10 //电平的阈值
    //变量型存储属性
    static var maxInputLevelForAllChannels = 0 //所有实例中输入的最大电平值
    //给属性添加didSet属性观察器，用来检查每次新设置的后的属性
    var currentLevel: Int = 0 {
    
        didSet {
        
            if currentLevel > AudioChannel.thresholdLevel {
                //将电平值设置为阈值
                currentLevel = AudioChannel.thresholdLevel
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                //存储当前电平值作为新输入的最大电平值
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
    //audio增量
    var changeLevel: Int {
    
        let diffLevel = currentLevel - AudioChannel.maxInputLevelForAllChannels
        return diffLevel
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

leftChannel.currentLevel = 11
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)















