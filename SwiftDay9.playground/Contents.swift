//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Persion {

    let name:String
    init(name: String) {
    
        self.name = name
        print("\(name) is being init")
    }
    
    deinit {
    
        print("\(name) is being deinit")
    }
}

var refrence1: Persion?
var refrence2: Persion?
var refrence3: Persion?

refrence1 = Persion(name: "andrew")
refrence2 = refrence1
refrence3 = refrence1

refrence1 = nil
refrence2 = nil
refrence3 = nil

class PersionUnit {

    let name:String
    init(name: String) {
    
        self.name = name
    }
    //  公寓是可以为nil
    var apartment: Apartment?
    
    deinit {
    
        print("\(name) is being deinit'")
    }
}


class Apartment {

    let apartUnit: String
    
    init(apartUnit: String){
    
        self.apartUnit = apartUnit
    }
    //可以为nil
    weak var persion: PersionUnit?
    
    deinit{
        
        print("Apartment \(apartUnit) is being deinit")
    }
}

var john: PersionUnit?
var apartUnit4A:Apartment?

john = PersionUnit(name: "John Appleseed")
apartUnit4A = Apartment(apartUnit: "4A")

john!.apartment = apartUnit4A
apartUnit4A!.persion = john

john = nil
apartUnit4A = nil


//let andrew = PersionUnit(name: "Andrew")
//let apart5A = Apartment(apartUnit: "5a")
//
//andrew.apartment = apart5A
//apart5A.persion = andrew


class Customer {

    let name: String
    //信用卡是可选的
    var card: CreditCard?
    init(name:String) {
    
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinit")
    }
    
}

class CreditCard {

    let number: UInt64
    //有效信用卡是必须要有开户人的
    unowned let customer: Customer
    init(number: UInt64, customer: Customer){
    
        self.number = number
        self.customer = customer
    }
    
    deinit {
        print("Card #\(number) is being deinit")
    }
}

var John: Customer?
var card: CreditCard?
John = Customer(name: "Andrew")
John!.card = CreditCard(number: 123456789123456789, customer: John!)

John = nil

class Country {

    let name: String
    //将capitalCity属性声明为隐式可选的属性。表示capitalCity的默认值为nil
    var capitalCity:City!
    init(name:String, capitalName:String) {
    
        self.name = name
        //Country初始化完成之后，将self传给City的构造函数
        self.capitalCity = City(name:capitalName, country: self)
    }
}

class City {

    let name: String
    unowned let country:Country
    init(name: String, country:Country) {
    
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")

class HTMLElement {

    let name:String
    let text:String?
    
    lazy var asHTML: Void ->String = {
        //增加一个捕获列表，表示用无主引用而不是强引用来捕获self
        [unowned self] in
        if let text = self.text {
         
            return "<\(self.name)>\(text)</\(self.name)>"
        }else {
        
            return "<\(self.name)/>"
        }
    }
    
    init(name: String ,text: String? = nil){
    
        self.name = name
        self.text = text
    }
    
    deinit{
    
        print("\(name) si being deinit")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default Text"
heading.asHTML = {

    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}

print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "P", text: "hello, world")
print(paragraph!.asHTML())
paragraph = nil
















