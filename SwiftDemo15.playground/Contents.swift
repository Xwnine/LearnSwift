//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Persion {

    var residence: Residence?
}

class Residence {

    var numberOfRooms = 1
}
//强制拆包
let john = Persion()

//let roomCount = john.residence!.numberOfRooms

if let roomCount = john.residence?.numberOfRooms {

    print("John' residence has \(roomCount) rooms")
}else {

    print("Unable to retrieve has  rooms")
}

john.residence = Residence()
let roomCount = john.residence!.numberOfRooms

class OtherPersion {

    var residence: OtherPresidence?
}

class OtherPresidence {

    var rooms = [Room]()
    var numberOfRooms: Int {
    
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        
        get {
            
            return rooms[i]
        }
        
        set {
            
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        
        print("The number of rooms is \(numberOfRooms)")
    }
    
    var address: Address?
}

class Room {

    let name: String
    init(name: String) {
        
        self.name = name
    }
}

class Address {
    
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil {
            return buildingNumber
        } else {
            return nil
        }
    }
}


let andrew = OtherPersion()
if let roomCount = andrew.residence?.numberOfRooms {

    print("Andrew's residence has \(roomCount) room(s)")
}else {

    print("Andrew Unable to retrieve the numbes of rooms")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Tian He Road"
andrew.residence?.address = someAddress

if andrew.residence?.printNumberOfRooms() != nil {

    print("it was possible to print the number of rooms")
}else {

    print("it was not possible to print the number of rooms")
}

if (andrew.residence?.address = someAddress) != nil {

    print(andrew.residence?.address)
}else {

    print("it was not possible to set address ")
}

let johnAddress = Address()
johnAddress.buildingName = "The Larches"
johnAddress.street = "Laurel Street"
andrew.residence?.address = johnAddress
if let johnStreet = andrew.residence?.address?.street {

    print("Andrew's street name is \(johnStreet).")
}else {

    print("Andrew unable to retrive the address")
}


if let firstRoomName = andrew.residence?[0].name {

    print(firstRoomName)
}else {

    print("Andrew's room name is nil")
}
andrew.residence?[0] = Room(name: "Bathroom")

let andrewHouse = OtherPresidence()
andrewHouse.rooms.append(Room(name: "living room"))
andrewHouse.rooms.append(Room(name: "Kitchen"))
andrew.residence = andrewHouse

if let firstRoomName = andrew.residence?[0].name {

    print(firstRoomName)
}else {

    print("init failure")
}


var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]];
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
//key "Brian"不存在 访问到一个可空返回值
testScores["Brian"]?[0] = 72

print(testScores["Dave"])
print(testScores["Bev"])
print(testScores["Brian"])

if let andrewStreet = andrew.residence?.address {

    print(andrewStreet)
}else {

    print("not init andrewStreet")
}

let andrewAddress = Address()
andrewAddress.buildingName = "Shi Pai Bridge"
andrewAddress.street = "Tian He Nan"
andrew.residence?.address = andrewAddress

if let andrewStreet = andrew.residence?.address?.street {

    print(andrewStreet)
}else {

    print("address init failure")
}


if let buildingIdentifier = andrew.residence?.address?.buildingIdentifier() {

    print(buildingIdentifier)
}else {

    print("buildingIdentifier is nil")
}

//可选链判断函数的返回值是否存在
if let beginsWithThe = andrew.residence?.address?.buildingIdentifier()?.hasPrefix("Shi") {

    if beginsWithThe {
    
        print(beginsWithThe)
    }else {
    
        print("andrwe's building identifier does not begin with the \"The\".")
    }
}

enum VendingMachineError: ErrorType {
    case InvalidSelection
    case InsufficientFunds(coinsNeeded: Int)
    case OutOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {

    var inventory = [
        "Candy Bar": Item(price:12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretezels": Item(price:7, count: 11)
    ]
    
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("DispenseSnack: \(snack)")
    }
    
    func vend(itemNamed name:String) throws {
    
        guard var item = inventory[name] else {
        
            throw VendingMachineError.InvalidSelection
        }
        
        guard item.count > 0 else {
        
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        item.count -= 1
        inventory[name] = item
        dispenseSnack(name)
    }
}

let favoriteSnacks = [

    "Alice": "chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnacks(persion: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[persion] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}


var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {

    try buyFavoriteSnacks("Alice", vendingMachine: vendingMachine)
}catch VendingMachineError.InvalidSelection {

    print("Invalide Selection")
}catch VendingMachineError.OutOfStock {

    print("Out of stack")
}catch VendingMachineError.InsufficientFunds(let consinsNeeded) {

    print("Insufficient funds. plsase insert an additional \(consinsNeeded)coins")
}

func someThrowingFunction() -> Int {
    
    return 10
}

let x = try? someThrowingFunction()
let y:Int?

do {

    y = try someThrowingFunction()
    
}catch {

    y = nil
}

//func fetchData() ->Data? {
//
//    if let data = try? fetchDataFormDisk() {
//    
//        return data
//    }
//    
//    if let data = try? fetchDataFormServer() {
//    
//        return data
//    }
//    return nil
//}

//func processFile(fileName: String) throws {
//    
//    if exists(fileName) {
//        let file = open(fileName)
//        
//        defer {
//
//            close(file)
//        }
//        
//        while let line = try file.readline() {
//            
//            
//        }
//        
//        close(file)
//    }
//}

class MediaItem {

    var name:String
    init(name:String) {
    
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    
    init(name: String, director: String){
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michile Curoze"),
    Song(name: "Blue Suede Shoes", artist: "Elivs Presley"),
    Movie(name: "Ciltizen Kane", director: "Orson Welles'"),
    Song(name: "The One And Only", artist: "Chesney Hawkes")
]













