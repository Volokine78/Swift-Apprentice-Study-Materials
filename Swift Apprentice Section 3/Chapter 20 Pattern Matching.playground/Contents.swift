import UIKit

var str = "Hello, playground"

var coordinate = (x: 1, y: 0, z: 0)

if (coordinate.y == 0) && (coordinate.z == 0) {
    print("along the x-axis")
}

if case (_, 0, 0) = coordinate {
    print("along the x-axis")
}

if case (let x, 0, 0) = coordinate {
    print("On the x-axis at \(x)")
}

if case let (x, y, 0) = coordinate {
    print("On the x-y plane at (\(x), \(y))")
}

let number = 5
if case (number, 0, 0) = coordinate {
    coordinate.x = number
}

func process(point: (x: Int, y: Int, z: Int)) -> String {
    if case (0, 0, 0) = point {
        return "At origin"
    }
    return "Not at origin"
}

let point = (x: 0, y: 0, z: 0)
let status = process(point: point)

func process1(point: (x: Int, y: Int, z: Int)) -> String {
    guard case (0, 0, 0) = point else {
        return "Not at origin"
    }
    return "At origin"
}

func process2(point: (x: Int, y: Int, z: Int)) -> String {
    let closeRange = -2...2
    let midRange = -5...5
    
    switch point {
        case (0, 0, 0):
            return "At origin"
        case (closeRange, closeRange, closeRange):
            return "Very close to origin"
        case (midRange, midRange, midRange):
            return "Nearby origin"
        default:
            return "Not near origin"
    }
}

let point2 = (x: 15, y: 5, z: 3)
let status2 = process2(point: point2)

// Minik Exercise
func population(count: Int) -> String {
    precondition(count >= 0)
    let noOne = 0
    let single = 1
    let few = 2...10
    let several = 11...20
    let many = 21...100
    
    switch count {
        case single:
            return "Single"
        case few:
            return "Few"
        case several:
            return "several"
        case many:
            return "Many"
        case noOne:
            return "No one"
        default:
            return "more than hundred."
    }
}

let crowd = 15
let populationNation = population(count: crowd)
print(populationNation)

let population = 3

switch population {
    case 1:
        print("single")
    case 2...3:
        print("a few")
    case 4..<6:
        print("several")
    default:
        print("many")
}

let groupSizes = [1, 5, 4, 6, 2, 1, 3]
for case 1 in groupSizes {
    print("Found an individual")
}

enum Direction {
    case north, south, east, west
}

let heading = Direction.north

if case .north = heading {
    print("Don't forget your jacket")
}

enum Organism {
    case plant
    case animal(legs: Int)
}

let pet = Organism.animal(legs: 4)

switch pet {
    case .animal(let legs):
        print("Potentially cuddly with \(legs) legs")
    default:
        print("No chance for cuddles")
}

if case .animal(let legs) = pet, case 2...4 = legs {
    print("potentially cuddly")
} else {
    print("no chance for cuddles")
}

// Minik Exercise
let names: [String?] = ["Michelle", nil, "Brandon", "Christine", nil, "David"]

print("Names:", terminator:" ")

for case .some(let name) in names where name.count > 6 {
    print(name, terminator:" ")
}
print("\n")

for case let name? in names {
    print(name)
}

let response: [Any] = [15, "George", 2.0]

for element in response {
    switch element {
        case is String:
            print("Found a string \(element)")
        default:
            print("Found something else")
    }
}

for element in response {
    let somebodyElsesLover = URL(string: "https://youtu.be/K52LctkjXuU")
    switch element {
        case let text as String:
            print("Found a string: \(text)")
        case let number as Double:
            print(number)
        default:
            print("Found somebody else's lova lova lova n?? n??n", somebodyElsesLover!)
    }
}

for number in 1...9 {
    switch number {
        case let x where x % 2 == 0:
            print("even")
        default:
            print("odd")
    }
}

enum LevelStatus {
    case complete
    case inProgress(percent: Double)
    case notStarted
}

let levels: [LevelStatus] = [.complete, .inProgress(percent: 0.9), .notStarted]

for level in levels {
    switch level {
        case .inProgress(let percent) where percent > 0.8:
            print("Almost there!")
        case .inProgress(let percent) where percent > 0.5:
            print("Halfway there!")
        case .inProgress(let percent) where percent > 0.2:
            print("Made it through the beginning!")
        case .complete:
            print("Complete")
        case .notStarted:
            print("Not started")
        case .inProgress:
            print("Just started")
    }
}

func timeOfDayDescription(hour: Int) -> String {
    switch hour {
        case 0, 1, 2, 3, 4, 5:
            return "Early morning"
        case 6, 7, 8, 9, 10, 11:
            return "Morning"
        case 12, 13, 14, 15, 16:
            return "Afternoon"
        case 17, 18, 19:
            return "Evening"
        case 20, 21, 22, 23:
            return "Late evening"
        default:
            return "INVALID HOUR!"
    }
}

let timeOfDay = timeOfDayDescription(hour: 12)

enum Number {
    case integerValue(Int)
    case doubleValue(Double)
    case booleanValue(Bool)
}

let a = 5
let b = 6
let c: Number? = .integerValue(7)
let d: Number? = .integerValue(8)

// pyramid of DOOM
if a != b {
    if let c = c {
        if let d = d {
            if case .integerValue(let cValue) = c {
                if case .integerValue(let dValue) = d {
                    if dValue > cValue {
                        print("a and b are different")
                        print("d is greater than c")
                        print("sum: \(a + b + cValue + dValue)")
                    }
                }
            }
        }
    }
}

if a != b ,
   let c = c,
   let d = d,
   case .integerValue(let cValue) = c,
   case .integerValue(let dValue) = d,
   dValue > cValue {
    print("a and b are different")
    print("d is greater than c")
    print("sum: \(a + b + cValue + dValue)")
}

let name = "Bob"
let age = 23

if case ("Bob", 23) = (name, age) {
    print("Found the right Bob!")
}

var username: String?
var password: String?

switch (username, password) {
    case let (username?, password?):
        print("Success! User: \(username) Pass: \(password)")
    case let (username?, nil):
        print("Password is missing. User: \(username)")
    case let (nil, password?):
        print("Username is missing. Pass: \(password)")
    case (nil, nil):
        print("Both username and password are missing ")
}

for _ in 1...3 {
    print("I will never ever fall in love with somebody else's lover n?? n??n")
}

let user: String? = "Bob"
guard let _ = user else {
    print("There is no user.")
    fatalError()
}
print("User exists, but identity not needed.")

guard user != nil else {
    print("There is no user.")
    fatalError()
}

struct Rectangle {
    let width: Int
    let height: Int
    let background: String
}

let view = Rectangle(width: 15, height: 60, background: "Green")

switch view {
    case _ where view.height < 50:
        print("Shorter than 50 units")
    case _ where view.width > 20:
        print("Over 50 tall, & over 20 wide")
    case _ where view.background == "Green":
        print("Over 50 tall, at most 20 wide, & green")
    default:
        print("Not avaliable.")
}
