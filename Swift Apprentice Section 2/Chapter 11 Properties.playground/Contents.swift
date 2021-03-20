import UIKit

var str = "Hello, playground"

struct Contact {
    var fullName: String
    let emailAddress: String
    var relationship = "Friend"
}

var person = Contact(fullName: "Grace Murray", emailAddress: "grace@navy.mil")
person.fullName
person.emailAddress
person.fullName = "Grace Hopper"
person.relationship

var boss = Contact(fullName: "Ray Wenderlich", emailAddress: "ray@raywenderlich.com", relationship: "Boss")

struct TV {
    var height: Double
    var width: Double
    
    var diagonal: Int {
        
    get {
        let result = (height * height + width * width).squareRoot().rounded()
        return Int(result)
    }
    set {
        let ratioWidth = 16.0
        let ratioHeight = 9.0
        
        let ratioDiagonal = (ratioWidth * ratioWidth + ratioHeight * ratioHeight).squareRoot()
        height = Double(newValue) * ratioHeight / ratioDiagonal
        width = height * ratioWidth / ratioHeight
        }
    }
}

var tv = TV(height: 55.5, width: 96.6)
tv.diagonal = 70
tv.height
tv.width
tv.diagonal
    
var tv1 = TV(height: 53.93, width: 95.87)
tv.diagonal
tv.width = tv.height
tv.diagonal

// Mini Exercise
tv.height = 50
tv.width = 90
tv.diagonal

struct Level {
    static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool {
        didSet {
            if unlocked && id > Self.highestLevel {
                Self.highestLevel = id
            }
        }
    }
}

let level1 = Level(id: 1, boss: "Chameleon", unlocked: true)
var level2 = Level(id: 2, boss: "Squid", unlocked: false)
let level3 = Level(id: 3, boss: "Chupacabra", unlocked: false)
let level4 = Level(id: 4, boss: "Yeti", unlocked: false)

let currentLevel = Level.highestLevel
level2.unlocked = true
Level.highestLevel

struct LightBulb {
    static let maxCurrent = 40
    var current: Int {
        didSet {
            if current > LightBulb.maxCurrent {
                print("""
                    Current is too high,
                    falling back to previous setting.
                    """)
                current = oldValue
            }
        }
    }
}

var light = LightBulb(current: 30)
print(light.current)
light.current = 50
print(light.current)

// Mini Exercise
struct LightBulb1 {
    static let maxCurrent = 40
    var isOn = false
    var current = Self.maxCurrent {
        willSet {
            if newValue > Self.maxCurrent {
                print("Current is too high, turning off to prevent burnout.")
                print("Current current is \(current) new value will be \(newValue)" )
                isOn = false
            }
        }
        didSet {
            if current > Self.maxCurrent {
                print("Current is too high, falling back to previous setting.")
                current = oldValue
            }
        }
    }
}

var bulb = LightBulb1()
bulb.isOn = true
bulb.current = 30
bulb.current = 50
print(bulb.isOn)
print(bulb.current)
bulb.isOn = true

struct Circle {
    lazy var pi = {
        ((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239.0)) * 4.0
    }()
    var radius: Double
    var circumference: Double {
        mutating get {
            pi * radius * 2
        }
    }
    init(radius: Double) {
        self.radius = radius
    }
}

var circle = Circle(radius: 5)
circle.circumference
circle.radius

// Mini Exercise
struct Circle1 {
    var radius = 0.0
    var circumference: Double {
        .pi * radius * 2
    }
}

var circle1 = Circle1(radius: 5)
let circumference = circle1.circumference

// MARK: - Challenge 1
struct IceCream {
    let name =  "Amazing fruit fountain"
    lazy var ingredients = {
        ["Strawberry", "Orange", "Melon"]
    }()
}

var iceCream = IceCream()
print(iceCream.ingredients)
print(iceCream.ingredients.append("Chocolate souce"))
print(iceCream.ingredients)

// MARK: - Challenge 2
struct FuelTank {
    var lowFuel: Bool
    var level: Double {
        didSet {
            if level > 1 {
                level = 1
            }
            if level < 0 {
                level = 0
            }
            lowFuel = level < 0.1
        }
    }
}

struct Car {
    let make: String
    let color: String
    var fuel: FuelTank
}

var car = Car(make: "Ferrari F50", color: "Red", fuel: FuelTank(lowFuel: false, level: 1))
car.fuel.level = 0.02
print(car.fuel.lowFuel)
car.fuel.level = 0.6
print(car.fuel.lowFuel)

struct FuelTank1 {

    var lowFuel: Bool
    var level: Double {
        didSet {
            if level < 0 {
                level = 0
            }
            if level > 1 {
                level = 1
            }
            lowFuel = level < 0.1
        }
    }
}

struct Car1{
    let make: String
    let color: String
    var tank: FuelTank1
}

var car1 = Car1(make: "DeLorean", color: "Silver", tank: FuelTank1(lowFuel: false, level: 1))
car1.tank.level = -1
print(car1.tank.level)
car1.tank.level = 1.1
